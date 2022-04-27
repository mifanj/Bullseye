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
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay (
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
            )
    }
}
struct RoundedImageViewFilled: View {
    var symbolName: String
    var body: some View {
        Image(systemName: symbolName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
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
            .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
            .overlay (
                RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct RoundedIndexView: View {
    var index: Int
    
    var body: some View {
        Text("\(index)")
            .font(.title3)
            .kerning(-0.2)
            .fontWeight(.bold)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.Leaderboard.roundedIndexViewSize, height: Constants.Leaderboard.roundedIndexViewSize)
            .overlay (
                Circle()
                    .strokeBorder(Color("LeaderboardRowBorderColor"), lineWidth: Constants.General.strokeWidth)
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
        RoundedIndexView(index: 2)
        RoundedIndexView(index: 2)
            .preferredColorScheme(.dark)
    }
}
