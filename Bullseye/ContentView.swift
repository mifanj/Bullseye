//
//  ContentView.swift
//  Bullseye
//
//  Created by Jack on 2022/3/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("🎯🎯🎯\n尽可能的靠近靶心")
            Text("89")
            HStack {
                Text("1")
                Slider(value: .constant(50), in: 1.0...100.0)
                Text("100")
            }
            Button(action: {}) {
                Text("走你")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewLayout(.fixed(width: 528, height: 320))
    }
}
