//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Jack on 2022/4/25.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var alertVisible: Bool
    @Binding var game: Game
    
    var body: some View {
        VStack {
            TopView(alertVisible: $alertVisible, game: $game)
                .padding()
            Spacer()
            BottomView(game: $game)
                .padding()
        }
            .background(
                RingsView()
            )
        
    }
}

struct TopView: View {
    
    @Binding var alertVisible: Bool
    @Binding var game: Game
    
    var body: some View {
        HStack{
            Button {
                game.restart()
                withAnimation {
                    alertVisible = false
                }
            } label: {
                RoundedImageViewStroked(symbolName: "arrow.counterclockwise")
            }
            Spacer()
            RoundedImageViewFilled(symbolName: "list.dash")
        }
    }
}

struct BottomView: View {
    @Binding var game: Game
    var body: some View {
        HStack{
            NumberView(title: "得分", content: "\(game.score)")
            Spacer()
            NumberView(title: "局次", content: "\(game.round)")
        }
    }
}

struct NumberView: View {
    var title: String
    var content: String
    
    var body: some View {
        VStack(spacing: 5) {
            NumberTitleView(title: title)
            RoundedTextViewStroked(content: content)
        }
    }
}

struct RingsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            ForEach(0..<5) { index in
                let size = Double(index + 1) * 100.0
                let opacity = colorScheme == .dark ? 0.1 : 0.3
                Circle()
                    .stroke(lineWidth: 20.0)
                    .frame(width: size, height: size)
                    .foregroundColor(
                        Color("BackgroundCircleColor")
                            .opacity((1 - 0.2 * Double(index)) * opacity)
                    )
            }
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(alertVisible: .constant(false), game: .constant(Game()))
        BackgroundView(alertVisible: .constant(false), game: .constant(Game()))
            .preferredColorScheme(.dark)
    }
}
