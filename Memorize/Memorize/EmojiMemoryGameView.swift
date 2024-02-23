//
//  ContentView.swift
//  Memorize
//
//  Created by Kai Yun on 2/15/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
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
            Button("Shuffle") {
                viewModel.shuffle()
            }
            themeButtonAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum:85), spacing:0)], spacing: 0) {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
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
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
                .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
