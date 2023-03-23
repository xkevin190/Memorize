//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Kevin Velasco on 17/3/23.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    static let emojis = ["😀", "😂", "🤣", "😊", "😍", "🥰", "😘", "😜", "🤪", "😎", "🤩", "🤑", "😴", "🥱", "🤢", "🤮", "😷", "🥵", "🥶", "🤯", "🚗", "🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒", "🚚", "🚛", "🚜", "🛵", "🛴", "🚲", "🛹", "🛴", "🚂", "🚆", "🚊"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairCards: 3, createCardContent: {pairIndex in
            emojis[pairIndex]
        });
    }
    
    @Published var model: MemoryGame<String> = createMemoryGame();
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    func choose (_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
