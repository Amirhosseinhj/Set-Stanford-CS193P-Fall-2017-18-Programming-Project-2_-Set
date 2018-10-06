//
//  ViewController.swift
//  Set
//
//  Created by Amirhossein on 10/5/18.
//  Copyright © 2018 Amirhossein Haji Jafari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var game = CardDeck()

    @IBOutlet var cardButtons: [UIButton]! {
        didSet {
            for button in cardButtons {
                button.isHidden = true
                button.titleLabel?.numberOfLines = 0
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateViewFromModel()
        
    }

    @IBAction func dealThreeMoreCardsButtonPressed(_ sender: UIButton) {
        
    }
    
    func updateViewFromModel() {
        for index in game.dealtCards.indices {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            var attributes : [NSAttributedString.Key : Any] = [
                .paragraphStyle : paragraphStyle
            ]
            var string = String()
            let someName = (game.dealtCards[index].symbol, game.dealtCards[index].number.rawValue)
            switch someName {
            case (.circle, let number): string = "●" * number
            case(.triangle, let number): string = "▲" * number
            case(.squar, let number): string = "■" * number
            }
            switch (game.dealtCards[index].shading, game.dealtCards[index].color){
            case (.open, .red):
                attributes[.strokeWidth] = 3.0
                attributes[.strokeColor] = UIColor.red
            case (.open, .green):
                attributes[.strokeWidth] = 3.0
                attributes[.strokeColor] = UIColor.green
            case (.open, .purple):
                attributes[.strokeWidth] = 3.0
                attributes[.strokeColor] = UIColor.purple
            case (.solid, .red):
                attributes[.strokeWidth] = -3.0
                attributes[.strokeColor] = UIColor.red
                attributes[.foregroundColor] = UIColor.red
            case (.solid, .green):
                attributes[.strokeWidth] = -3.0
                attributes[.strokeColor] = UIColor.green
                attributes[.foregroundColor] = UIColor.green
            case (.solid, .purple):
                attributes[.strokeWidth] = -3.0
                attributes[.strokeColor] = UIColor.purple
                attributes[.foregroundColor] = UIColor.purple
            case (.striped, .red):
                attributes[.strokeWidth] = -3.0
                attributes[.strokeColor] = UIColor.red
                attributes[.foregroundColor] = UIColor.red.withAlphaComponent(0.15)
            case (.striped, .green):
                attributes[.strokeWidth] = -3.0
                attributes[.strokeColor] = UIColor.green
                attributes[.foregroundColor] = UIColor.green.withAlphaComponent(0.15)
            case (.striped, .purple):
                attributes[.strokeWidth] = -3.0
                attributes[.strokeColor] = UIColor.purple
                attributes[.foregroundColor] = UIColor.purple.withAlphaComponent(0.15)
            }
            
            let attributedString = NSAttributedString(string: string, attributes: attributes)
            cardButtons[index].setAttributedTitle(attributedString, for: .normal)
            cardButtons[index].backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.968627451, blue: 0.9019607843, alpha: 1)
            cardButtons[index].isHidden = false
        }
    }
    
}

extension String {
    static func *(left: String, right: Int) -> String{
        var stringToShow = left
        if right != 0 {
            for i in 1...abs(right) {
                if i == right {break}
                stringToShow += "\n"
                stringToShow += left
            }
        } else {
            return ""
        }
        return stringToShow
    }
}
