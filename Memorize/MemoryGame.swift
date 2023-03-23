//
//  MemoryGame.swift
//  Memorize
//
//  Created by Kevin Velasco on 17/3/23.
//

import Foundation



struct MemoryGame <CardContent> {
    private(set) var cards: Array<Card>
    
    init(numberOfPairCards: Int, createCardContent: (Int)-> CardContent) {
        cards = Array<Card>();
        for pairIndex in 0..<numberOfPairCards {
            print("executed here")
            let content = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
    }
    
    
    func findCard (of card: Card) -> Int {
             
        for index in 0..<cards.count {
            if(cards[index].id == card.id) {
                return index;
            }
        }
        
        return 0
    }
    
    mutating func choose(_ card: Card) {
        if let index = cards.firstIndex(where: {$0.id == card.id}) {
            cards[index].isfaceUp.toggle()
        }
        
        print("\(cards) ")
        
    }

    
    struct Card: Identifiable {
        var id: Int
        var isfaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
