//
//  MyAppApp.swift
//  MyApp
//  Med Gitignore og nytt navn på appfil
//  Created by Terje Moe on 03/01/2026.
// Denne bruker JSON fil og fake Appstore
// Oppdatert med ny github 01.01.2026

import SwiftUI

@main
struct MyAppApp: App {
    @StateObject private var store = Store()
    @StateObject private var game = Game()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
                .environmentObject(game)
                .task {
                    await store.loadProducts()
                    game.loadScores()
                    store.loadStatus()
                }
        }
    }
}
