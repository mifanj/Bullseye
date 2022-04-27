//
//  ContentView.swift
//  Bullseye
//
//  Created by Jack on 2022/3/25.
//

import SwiftUI

struct ContentView: View {

    @State private var sliderValue: Double = 50.0
    
    @State private var alertVisible: Bool = false
    @State private var game: Game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(alertVisible: $alertVisible, game: $game)
            VStack(spacing: alertVisible ? -3.0 : 0) {
                IntroView(game: $game)
                    .padding(.bottom, alertVisible ? 0 : 100.0)
                if alertVisible {
                    PointsView(alertVisible: $alertVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                } else {
                    HitMeButton(alertVisible: $alertVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                }
            }
            if !alertVisible {
                SliderView(value: $sliderValue)
                    .transition(.scale)
            }
        }
    }
}

struct IntroView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            IntroTextView(text: "🎯🎯🎯\n尽可能的把滑块拖动到预期位置")
            BigNumberTextView(number: game.target)
        }
    }
}

struct SliderView: View {
    @Binding var value: Double
    
    var body: some View {
        HStack {
            SliderTextView(number: 1)
            Slider(value: $value, in: 1.0...100.0)
                .foregroundColor(Color("AccentColor"))
            SliderTextView(number: 100)
        }
    }
}

struct HitMeButton: View {
    @Binding var alertVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        Button(action: {
            withAnimation {
                alertVisible = true
            }
        }) {
            Text("走你")
                .kerning(2.0)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding()
        .background(ZStack {
            Color("ButtonColor")
            LinearGradient(gradient: Gradient(colors: [.white.opacity(0.3), .clear]), startPoint: .top, endPoint: .bottom)
        })
        .foregroundColor(.white)
        .cornerRadius(Constants.General.roundRectCornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                .strokeBorder(.white, lineWidth: Constants.General.strokeWidth)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewLayout(.fixed(width: 528, height: 320))
        
        ContentView()
            .preferredColorScheme(.dark)
        ContentView().previewLayout(.fixed(width: 528, height: 320))
            .preferredColorScheme(.dark)
    }
}
