//
//  Card.swift
//  Set
//
//  Created by Amirhossein on 10/5/18.
//  Copyright © 2018 Amirhossein Haji Jafari. All rights reserved.
//

import Foundation

struct Card {
    var symbol: Symbol
    var color: Color
    var shading: Shading
    var number: Number
    
    enum Symbol {
        case triangle
        case squar
        case circle
        
        static var all: [Symbol] {
            return [Symbol.triangle, .squar, .circle]
        }
    }
    enum Color {
        case red
        case purple
        case green
        
        static var all: [Color] {
            return [Color.red, .purple, .green]
        }
    }
    enum Shading {
        case solid
        case striped
        case open
        
        static var all: [Shading] {
            return [Shading.solid, .open, .striped]
        }
    }
    enum Number: Int {
        case one = 1
        case two = 2
        case three = 3
        
        static var all: [Number] {
            return [Number.one, .two, .three]
        }
    }
    
}
