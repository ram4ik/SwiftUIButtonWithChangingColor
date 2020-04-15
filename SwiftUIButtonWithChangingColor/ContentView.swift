//
//  ContentView.swift
//  SwiftUIButtonWithChangingColor
//
//  Created by Ramill Ibragimov on 15.04.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: {
            
        }) {
            Text("Hello, SwiftUI!")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color.white)
        }.padding()
        .background(ButtonBackground())
        .cornerRadius(19)
    }
}

struct ButtonBackground: View {
    @State private var colorChange = false
    
    let timer = Timer.publish(every: 0.4, on: .main, in: .default).autoconnect()
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [
            self.colorChange ? Color.red : Color.pink,
            self.colorChange ? Color.orange : Color.purple
        ]), startPoint: .leading, endPoint: .trailing)
            .onReceive(timer) { time in
                withAnimation(.easeInOut) {
                    self.colorChange.toggle()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
