//
//  Instructions.swift
//  MyApp
//
//  Created by Terje Moe on 17/11/2024.
//

import SwiftUI

struct Instructions: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack{
            InfoBasckroundImage()
            
            VStack{
                Image("quiz_background_2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .padding(.top)
                
                ScrollView{
                    Text("Hvordan Spille")
                        .font(.largeTitle)
                        .padding()
                    
                    VStack(alignment: .leading) {
                        Text("Velkommen til vår spørrelek! Her får du noen spørsmål fra vår database, du må svare riktig ellers mister du poeng!😱")
                            .padding([.horizontal, .bottom])
                        
                        Text("Hvert spørsmål gir 5 poeng, men for hvert feil svar, mister du 1 poeng")
                            .padding([.horizontal, .bottom])
                        
                        Text("Dersom du sliter med å svare? Du kan velge å få ett hint eller kategori , du mister da 1 poeng")
                            .padding([.horizontal, .bottom])
                        
                        Text("Når du har svart riktig, får du poengene du har igjen, å de legges til poeng totalen du hadde fra før.")
                            .padding(.horizontal)
                    }
                    .font(.title3)
                    
                    Text("Lykke Til!")
                        .font(.title)
                }
                .foregroundStyle(.black)
                Button("OK") {
                    dismiss()
                }
                .doneButtom()
            }
        }
    }
}

#Preview {
    Instructions()
}
