//
//  TextViews.swift
//  Bullseye
//
//  Created by Jack on 2022/4/10.
//

import SwiftUI

struct IntroTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .kerning(2.0)
            .font(.footnote)
            .multilineTextAlignment(
                .center)
            .lineSpacing(4.0)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberTextView: View {
    var number: Int
    
    var body: some View {
        Text("\(number)")
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderTextView: View {
    var number: Int
    
    var body: some View {
        Text("\(number)")
            .font(.callout)
            .fontWeight(.bold)
            .foregroundColor(Color("TextColor"))
            .frame(width: 35.0)
    }
}

struct NumberTitleView: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.caption)
            .fontWeight(.bold)
            .kerning(1.5)
            .foregroundColor(Color("TextColor"))
    }
}

struct PointsTextView: View {
    var points: Int
    var body: some View {
        Text("最终得分\(points)分\n🎉🎉🎉")
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(
                .center)
            .lineSpacing(12.0)
    }
}

struct StartNewRoundTextView: View {
    var body: some View {
        Text("再来一局")
            .font(.body)
            .fontWeight(.bold)
            .multilineTextAlignment(
                .center)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 12.0)
                    .fill(Color.accentColor)
            )
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            IntroTextView(text: "介绍文本")
            BigNumberTextView(number: 50)
            SliderTextView(number: 1)
            NumberTitleView(title: "得分")
            PointsTextView(points: 200)
            StartNewRoundTextView()
        }
    }
}
