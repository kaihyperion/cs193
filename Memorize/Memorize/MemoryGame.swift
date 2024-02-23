//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Kai Yun on 2/22/24.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card> // private(set) allows people to just look at it but not allow to modify anything (this is known as Access Control)
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        // your job inside init is to initialize all your vars
        cards = Array<Card>() // or [Card]() or []
        
        // now add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    func choose(_ card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContent  // use `let` because we dont want content of cards to change
    }
}
