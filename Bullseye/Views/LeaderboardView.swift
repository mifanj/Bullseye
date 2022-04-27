//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Jack on 2022/4/27.
//

import SwiftUI

struct LeaderboardView: View {
    var body: some View {
        RowView(index: 1, score: 456, date: Date())
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack{
            RoundedIndexView(index: index)
            Spacer()
            ScoreTextView(score: score)
            Spacer()
            DateTextView(date: date)
            Spacer()
        }
            .background(
                RoundedRectangle(cornerRadius: .infinity)
                    .strokeBorder(lineWidth: Constants.General.strokeWidth)
                    .foregroundColor(Color("LeaderboardRowBorderColor"))
            )
            .padding()
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
        LeaderboardView().previewLayout(.fixed(width: 528, height: 320))
        
        LeaderboardView()
            .preferredColorScheme(.dark)
        LeaderboardView().previewLayout(.fixed(width: 528, height: 320))
            .preferredColorScheme(.dark)
    }
}
