//
//  ContentView.swift
//  Memorize
//
//  Created by Oluwatayo Adegboye on 12/06/2023.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["✈️","🚐","🚀","🚌","🥁","🧼","🪬","💊","⚰️","⚱️","💉","💡","📷","📱","🕰️","🐶","🦀","🥉","🎧"]
    @State var emojiCount = 19
    var body: some View {
        VStack(){
            ScrollView(showsIndicators: false){
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(emojis[0..<emojiCount], id:\.self, content: {emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    })
                }
            }
            Spacer()
            HStack(alignment: .center){
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }.padding(.horizontal)
    }
    
    var remove: some View{
        Button{
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    var add: some View{
        Button{
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {Image(systemName: "plus.circle")}
    }
}

struct CardView: View{
    var content: String
    @State var isFaceUp = true
    var body: some View{
        ZStack(alignment: .center){
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3.0).foregroundColor(.red)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape.fill().foregroundColor(.red)
            }
            
        }.foregroundColor(.red)
            .onTapGesture {
                isFaceUp = !isFaceUp
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone SE (3rd generation)")
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
