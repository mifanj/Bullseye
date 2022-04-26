//
//  RoundViews.swift
//  Bullseye
//
//  Created by Jack on 2022/4/25.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var symbolName: String
    var body: some View {
        Image(systemName: symbolName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: 56.0, height: 56.0)
            .overlay (
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0)
            )
    }
}
struct RoundedImageViewFilled: View {
    var symbolName: String
    var body: some View {
        Image(systemName: symbolName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: 56.0, height: 56.0)
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
            )
    }
}

struct RoundedTextViewStroked: View {
    var content: String
    var body: some View {
        Text(content)
            .font(.title3)
            .kerning(-0.2)
            .fontWeight(.bold)
            .foregroundColor(Color("TextColor"))
            .frame(width: 68.0, height: 56.0)
            .overlay (
                RoundedRectangle(cornerRadius: 21.0)
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0)
            )
    }
}

struct RoundViews_Previews: PreviewProvider {
    static var previews: some View {
        RoundedImageViewStroked(symbolName: "arrow.counterclockwise")
        RoundedImageViewStroked(symbolName: "arrow.counterclockwise")
            .preferredColorScheme(.dark)
        RoundedImageViewFilled(symbolName: "arrow.counterclockwise")
        RoundedImageViewFilled(symbolName: "arrow.counterclockwise")
            .preferredColorScheme(.dark)
        RoundedTextViewStroked(content: "999")
        RoundedTextViewStroked(content: "999")
            .preferredColorScheme(.dark)
    }
}
