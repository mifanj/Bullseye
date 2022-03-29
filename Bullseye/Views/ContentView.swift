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
        VStack {
            Text("🎯🎯🎯\n尽可能的把滑块拖动到预期位置")
                .bold()
                .kerning(2.0)
                .font(.footnote)
                .multilineTextAlignment(
                    .center)
                .lineSpacing(4.0)
            Text("\(game.target)")
                .kerning(-1.0)
                .font(.largeTitle)
                .fontWeight(.black)
            HStack {
                Text("1")
                    .font(.callout)
                    .fontWeight(.bold)
                Slider(value: $sliderValue, in: 1.0...100.0)
                Text("100")
                    .font(.callout)
                    .fontWeight(.bold)
            }
            Button(action: {
                alertVisible = true
            }) {
                Text("走你")
            }.alert(isPresented: $alertVisible, content: {
                let roundedVaule: Int = Int(sliderValue.rounded())
                return Alert(title: Text("得分"),
                             message: Text("你选中的数值是\(sliderValue)\n四舍五入就是\(roundedVaule)\n得分是\(game.points(sliderValue: roundedVaule))"),
                      dismissButton: .default(Text("棒棒哒")))
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewLayout(.fixed(width: 528, height: 320))
    }
}
