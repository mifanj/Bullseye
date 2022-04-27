//
//  PointsView.swift
//  Bullseye
//
//  Created by Jack on 2022/4/26.
//

import SwiftUI

struct PointsView: View {
    @Binding var alertVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        
        let roundedValue: Int = Int(sliderValue.rounded())
        let points: Int = game.points(sliderValue: roundedValue)
        
        VStack(spacing: 10.0) {
            IntroTextView(text: "你选中的数值是\(sliderValue)\n四舍五入就是")
            BigNumberTextView(number: roundedValue)
            PointsTextView(points: points)
            Button {
                game.startNewRound(points: points)
                withAnimation {
                    alertVisible = false
                }
            } label: {
                StartNewRoundTextView()
            }

        }
            .padding()
            .frame(maxWidth: 300.0)
            .background(Color("BackgroundColor"))
            .cornerRadius(Constants.General.roundRectCornerRadius)
            .shadow(radius: 10.0, x: 5.0, y: 5.0)
    }
}

struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        PointsView(alertVisible: .constant(true), sliderValue: .constant(50.0), game: .constant(Game()))
        PointsView(alertVisible: .constant(true), sliderValue: .constant(50.0), game: .constant(Game()))
            .previewLayout(.fixed(width: 528, height: 320))
        
        PointsView(alertVisible: .constant(true), sliderValue: .constant(50.0), game: .constant(Game()))
            .preferredColorScheme(.dark)
        PointsView(alertVisible: .constant(true), sliderValue: .constant(50.0), game: .constant(Game()))
            .previewLayout(.fixed(width: 528, height: 320))
            .preferredColorScheme(.dark)
    }
}
