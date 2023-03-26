//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Kevin Velasco on 17/3/23.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    static let emojis = ["😀", "😂", "🤣", "😊", "😍", "🥰", "😘", "😜", "🤪", "😎", "🤩", "🤑", "😴", "🥱", "🤢", "🤮", "😷", "🥵", "🥶", "🤯", "🚗", "🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒", "🚚", "🚛", "🚜", "🛵", "🛴", "🚲", "🛹", "🛴", "🚂", "🚆", "🚊"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairCards: 9, createCardContent: {pairIndex in
            emojis[pairIndex]
        });
    }
    
    @Published var model: MemoryGame<String> = createMemoryGame();
    
    var cards: Array<Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    func choose (_ card: Card) {
        model.choose(card)
    }
}
