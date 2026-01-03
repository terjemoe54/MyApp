//
//  Settings.swift
//  MyApp
//
//  Created by Terje Moe on 03/01/2026.
//

import SwiftUI


struct Settings: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var store: Store

    var body: some View {
        ZStack {
            InfoBasckroundImage()
            VStack {
                Text("Hvilke kategorier vil du ha spørsmål fra?")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.top)
                
                ScrollView{
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(0..<4) { i in
                            if store.books[i] == .active || (store.books[i] == .locked && store.purchasedIDs.contains("kt\(i+1)")) {
                                ZStack(alignment: .bottomTrailing) {
                                    Image("kt\(i+1)")
                                        .resizable()
                                        .scaledToFit()
                                        .shadow(radius: 7)
                                    
                                    Image(systemName: "checkmark.circle.fill")
                                        .font(.largeTitle)
                                        .imageScale(.large)
                                        .foregroundStyle(.green)
                                        .shadow(radius: 1)
                                        .padding(3)
                                }
                                .onTapGesture {
                                    store.books[i] = .inactive
                                    store.saveStatus()
                                }
                                .task {
                                    store.books[i] = .active
                                    store.saveStatus()
                                }
                            } else if store.books[i] == .inactive {
                            
                            
                                ZStack(alignment: .bottomTrailing) {
                                    Image("kt\(i+1)")
                                        .resizable()
                                        .scaledToFit()
                                        .shadow(radius: 7)
                                        .overlay(Rectangle().opacity(0.33))
                                    
                                    Image(systemName: "circle")
                                        .font(.largeTitle)
                                        .imageScale(.large)
                                        .foregroundStyle(.green.opacity(0.5))
                                        .shadow(radius: 1)
                                        .padding(3)
                                }
                                .onTapGesture {
                                    store.books[i] = .active
                                    store.saveStatus()
                                }
                            } else {
                            
                                ZStack {
                                    Image("kt\(i+1)")
                                        .resizable()
                                        .scaledToFit()
                                        .shadow(radius: 7)
                                        .overlay(Rectangle().opacity(0.75))
                                    
                                    Image(systemName: "lock.fill")
                                        .font(.largeTitle)
                                        .imageScale(.large)
                                        .shadow(color: .white.opacity(0.75),radius: 3)
                                }
                                .onTapGesture {
                                    let product = store.products[i - 1]
                                    
                                    Task {
                                        await store.purchase(product)
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                    
                }
                
                Button("OK") {
                    dismiss()
                }
                .doneButtom()
           }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    Settings()
        .environmentObject(Store())
}
