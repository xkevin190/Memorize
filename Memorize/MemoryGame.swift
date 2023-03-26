//
//  MemoryGame.swift
//  Memorize
//
//  Created by Kevin Velasco on 17/3/23.
//

import Foundation

struct MemoryGame <CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndonlyFaceUpCard: Int? {
        get { cards.indices.filter({cards[$0].isfaceUp}).oneAndOnly }
        set(newPropertyValue){
            cards.indices.forEach({cards[$0].isfaceUp = ( $0 == newPropertyValue )})
        }
    }
    
    
    mutating func choose(_ card: Card) {
        if let choosenIndex = cards.firstIndex(where: {$0.id == card.id}),
            !cards[choosenIndex].isfaceUp,
            !cards[choosenIndex].isMatched
        {
            
            if let potencialMatchIndex = indexOfTheOneAndonlyFaceUpCard {
                if cards[choosenIndex].content == cards[potencialMatchIndex].content {
                    cards[choosenIndex].isMatched = true
                    cards[potencialMatchIndex].isMatched = true
                }
                cards[choosenIndex].isfaceUp = true
            } else {
                indexOfTheOneAndonlyFaceUpCard = choosenIndex
            }
        }
        
    }
    
    init(numberOfPairCards: Int, createCardContent: (Int)-> CardContent) {
        cards = Array<Card>();
        for pairIndex in 0..<numberOfPairCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
    }

    struct Card: Identifiable {
        var id: Int
        var isfaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
    
}

extension Array {
    var oneAndOnly : Element? {
         print("count", count)
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
