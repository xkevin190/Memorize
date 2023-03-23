//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Kevin Velasco on 15/3/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game: EmojiMemoryGame = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
