//
//  PokemonDetailView.swift
//  PokemonApi
//
//  Created by Christopher Woods on 10/27/23.
//

import SwiftUI

struct PokemonDetailView: View {
    @Binding var currentURL: String
    @Binding var isShowing: Bool
    var name = "Bulbasaur"
    var image = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png"
    
    var body: some View {
        VStack{
            Spacer().frame(height: 20)
            HStack{
                VStack{
                    Text(name)
                        .bold()
                    AsyncImage(url: URL(string: image))
                    
                }
                Spacer()
            }
            .padding()
            Spacer()
            
            VStack{
                HStack{
                    Text("test")
                }
            }
        }
        .frame(width: 300, height: 485)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button{
            isShowing.toggle()
        }label:{
            XDismissButton()
        }, alignment: .topTrailing)

        
    }
        

}

#Preview {
    PokemonDetailView(currentURL: .constant(""), isShowing: .constant(false))
}
