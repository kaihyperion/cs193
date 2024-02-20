//
//  ContentView.swift
//  Memorize
//
//  Created by Kai Yun on 2/15/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🍆","🍑","🥕","🍌","h"]
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                
            }
        }

        .foregroundColor(.orange)
        .imageScale(.small)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @ State var isFaceUp = true
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            } else {
                base
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
