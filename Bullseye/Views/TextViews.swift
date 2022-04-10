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
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            IntroTextView(text: "介绍文本")
            BigNumberTextView(number: 50)
            SliderTextView(number: 1)
        }
    }
}
