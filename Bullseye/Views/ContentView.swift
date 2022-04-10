//
//  ContentView.swift
//  Bullseye
//
//  Created by Jack on 2022/3/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sliderValue: Double = 20.0
    
    @State private var alertVisible: Bool = false
    @State private var game: Game = Game()
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                IntroView(game: $game)
                SliderView(value: $sliderValue)
                .padding()
                HitMeButton(alertVisible: $alertVisible, sliderValue: $sliderValue, game: $game)
            }
        }
    }
}

struct IntroView: View {
    @Binding var game: Game
    
    var body: some View {
        IntroTextView(text: "🎯🎯🎯\n尽可能的把滑块拖动到预期位置")
        BigNumberTextView(number: game.target)
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
            alertVisible = true
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
        .cornerRadius(21.0)
        .overlay(
            RoundedRectangle(cornerRadius: 21.0)
                .strokeBorder(.white, lineWidth: 3.0)
        )
        .alert(isPresented: $alertVisible, content: {
            let roundedVaule: Int = Int(sliderValue.rounded())
            return Alert(title: Text("得分"),
                         message: Text("你选中的数值是\(sliderValue)\n四舍五入就是\(roundedVaule)\n得分是\(game.points(sliderValue: roundedVaule))"),
                  dismissButton: .default(Text("棒棒哒")))
        })
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
