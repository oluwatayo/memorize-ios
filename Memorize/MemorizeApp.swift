//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Oluwatayo Adegboye on 12/06/2023.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
