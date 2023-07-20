//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Oluwatayo Adegboye on 18/07/2023.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject{
    
    static let emojis: Array<String> = ["😀","😅","🥲","🥹","😍","🤪","😎","🥸","🥶","😪","🤑","🤧","🫠","😤","🤗","🤯","🥳","😏","😰"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: 4){ pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
        
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    //MARK: - Inten(s)
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
