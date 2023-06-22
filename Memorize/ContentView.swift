//
//  ContentView.swift
//  Memorize
//
//  Created by Oluwatayo Adegboye on 12/06/2023.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["✈️","🚐","🚀","🛵"]
    var emojiCount = 2
    var body: some View {
        VStack{
            HStack{
                ForEach(emojis[0..<emojiCount], id:\.self, content: {emoji in
                    CardView(content: emoji)
                })
            }
            HStack(alignment: .center){
                remove
                Spacer()
                add
            }.padding([.leading, .trailing], 10.0)
        }.padding([.leading, .trailing], 10.0)
    }
    
    var remove: some View{
        Button(action: {}, label: {
            Text("Remove Card")
        })
    }
    var add: some View{
        Button(action: {}, label: {Text("Add Card")})
    }
}

struct CardView: View{
    var content: String
    @State var isFaceUp = false
    var body: some View{
        ZStack(alignment: .center){
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3.0).foregroundColor(.red)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape.fill().foregroundColor(.red)
            }
            
        }.padding([.leading, .trailing], 10.0)
            .foregroundColor(.red)
            .onTapGesture {
                isFaceUp = !isFaceUp
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
