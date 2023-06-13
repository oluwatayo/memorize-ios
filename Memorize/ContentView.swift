//
//  ContentView.swift
//  Memorize
//
//  Created by Oluwatayo Adegboye on 12/06/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .topTrailing) {
            RoundedRectangle(cornerRadius: 25.0)
                .stroke(lineWidth: 3.0)
            Text("Hello SwiftUI🥳")
                .foregroundColor(.mint)
                .padding()
        }
        .padding()
        .foregroundColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
