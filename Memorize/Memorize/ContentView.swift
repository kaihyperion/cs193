//
//  ContentView.swift
//  Memorize
//
//  Created by Kai Yun on 2/15/24.
//

import SwiftUI

struct ContentView: View {
    @ State var emojis : Array<String> = []
    let humanTheme = ["👶","👶🏻","👶🏼","👶🏻","👶🏽","👶🏾","👶🏿","🧑","🧑🏻","🧑🏼","🧑🏽","🧑🏾","🧑🏿"]
    let foodTheme = ["🫒","🍆","🍑","🥕","🍌","🍐","🍒","🥦","🍍","🥒","🥭"]
    let sportsTheme = ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🥏","🎱","🏓"]
    
    @ State var cardCount: Int = 0
    @ State var themeColor: Color = .orange
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                cards
            }
            Spacer()
            themeButtonAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum:60))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode:. fit)
            }
        }
        .foregroundColor(themeColor)
    }
    var themeButtonAdjusters: some View {
        HStack (alignment: .bottom, spacing: 25) {
            
            humanThemeButton
            Spacer()
            foodThemeButton
            Spacer()
            sportsThemeButton
            
        }
    }
    
//    var cardCountAdjusters: some View {
//        HStack {
//            cardRemover
//            Spacer()
//            cardAdder
//        }
//        .imageScale(.large)
//        .font(.largeTitle)
//    }
//    
    // to make a function in swift
//    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
//        Button(action: {
//            cardCount += offset
//        }, label: {
//            Image(systemName: symbol)
//        })
//        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
//    }
//    var cardRemover: some View {
//        return cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
//    }
//    var cardAdder: some View {
//        return cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
//    }
    
    func cardThemeAdjuster(by themeName: String, theme: Array<String>, themeIcon: String) -> some View {
        Button(action: {
            // random number of pairs of cards
            cardCount = Int.random(in:4..<theme.count)
            
            emojis = theme
            if themeName == "human" {
                themeColor = .blue
            } else if themeName == "food" {
                themeColor = .red
            } else {
                themeColor = .green
            }
            
        }, label: {
            VStack() {
                Image(systemName: themeIcon)
                    .font(.largeTitle)
                Text(themeName)
                    .font(.subheadline)
            }
        })
    }
    var humanThemeButton: some View {
        return cardThemeAdjuster(by: "human", theme:humanTheme.shuffled(), themeIcon: "figure")
    }
    var foodThemeButton: some View {
        return cardThemeAdjuster(by: "food", theme:foodTheme.shuffled(), themeIcon: "carrot.fill")
    }
    var sportsThemeButton: some View {
        return cardThemeAdjuster(by: "Sports", theme:sportsTheme.shuffled(), themeIcon: "dumbbell.fill")
    }
}

struct CardView: View {
    let content: String
    @ State var isFaceUp = true
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
