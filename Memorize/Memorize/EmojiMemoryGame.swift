//
//  EmojiMemoryGame.swift
//  Memorize
// ViewModel
//
//  Created by Kai Yun on 2/22/24.
//

import SwiftUI

//observableObject protocol allows to be reactive

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👶","👶🏻","👶🏼","👶🏻","👶🏽","👶🏾","👶🏿","🧑","🧑🏻","🧑🏼","🧑🏽","🧑🏾","🧑🏿"] // static allows us to make emojis global but keeps it inside of class
        
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 8) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
//    var objectWillChange: ObservableObjectPublisher
    // view will see all the changes and let the view change
    // or
    // simply put: @Published in front of var that "will change"
    @Published private var model = createMemoryGame()
    
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - INTENTs
    
    func shuffle() {
        model.shuffle()
//        objectWillChange.send()
    }
    
    // choose is called "intent" function
    func choose(_ card: MemoryGame<String>.Card) { // if you want parameter names to be 'internal only' and no external name: we simply place underbar (_)
        model.choose(card)
    }
}
