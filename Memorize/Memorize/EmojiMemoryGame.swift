//
//  EmojiMemoryGame.swift
//  Memorize
// ViewModel
//
//  Created by Kai Yun on 2/22/24.
//

import SwiftUI

class EmojiMemoryGame {
    private static let emojis = ["👶","👶🏻","👶🏼","👶🏻","👶🏽","👶🏾","👶🏿","🧑","🧑🏻","🧑🏼","🧑🏽","🧑🏾","🧑🏿"] // static allows us to make emojis global but keeps it inside of class
        
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) { // if you want parameter names to be 'internal only' and no external name: we simply place underbar (_)
        model.choose(card)
    }
}
