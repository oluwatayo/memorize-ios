//
//  ContentView.swift
//  Memorize
//
//  Created by Oluwatayo Adegboye on 12/06/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        ScrollView(showsIndicators: false){
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))], spacing: 8.0){
                ForEach(viewModel.cards, content: {card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                })
            }
        }.padding(.horizontal)
    }
}

struct CardView: View{
    let card: MemoryGame<String>.Card

    var body: some View{
        ZStack(alignment: .center){
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3.0).foregroundColor(.red)
                Text(card.content)
                    .font(.largeTitle)
            } else {
                shape.fill().foregroundColor(.red)
            }
            
        }.foregroundColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .previewDevice("iPhone SE (3rd generation)")
            .preferredColorScheme(.light)
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
    }
}
