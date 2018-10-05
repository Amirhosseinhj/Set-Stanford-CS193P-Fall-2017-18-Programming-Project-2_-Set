//
//  CardDeck.swift
//  Set
//
//  Created by Amirhossein on 10/5/18.
//  Copyright © 2018 Amirhossein Haji Jafari. All rights reserved.
//

import Foundation

struct CardDeck {
    private var cards = [Card]()
    var dealtCards = [Card]()
    
    init() {
        for symbol in Card.Symbol.all {
            for color in Card.Color.all {
                for shading in Card.Shading.all {
                    for number in Card.Number.all {
                        cards.append(Card(symbol: symbol, color: color, shading: shading, number: number))
                    }
                }
            }
        }
//        Deal 12 random cards to start
        for _ in 1...12 {
            dealtCards.append(cards.remove(at: cards.count.arc4Random))
        }
    }
    
    mutating func dealCards() {
        if cards.count >= 3 {
            for _ in 1...3 {
                dealtCards.append(cards.remove(at: cards.count.arc4Random))
            }
        }
    }
    
    
}

extension Int {
    var arc4Random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return  -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
