//
//  ContentView.swift
//  PokemonApi
//
//  Created by Christopher Woods on 10/26/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var Pokemon = PokemonViewModel()
    @State var isBinding = false
    @State var currentURL = ""
    

    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns, spacing:20){
                ForEach(Pokemon.pokemons) { pokemon in
                    VStack{
                        
                        Text(pokemon.name)
                        AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(Pokemon.getPokemonIndex(pokemon: pokemon)).png"))
                            
                                                
                    }
                    .onTapGesture{
                        Pokemon.currentNumber = Pokemon.getPokemonIndex(pokemon: pokemon)
                        Pokemon.setCurrent()
                        Pokemon.fetchDetails()
                            for stats in Pokemon.stats{
                                print(stats.stat.name)
                                print(stats.base_stat)
                            }
                        
                        }
                    
                }
            }
            
        }.sheet(isPresented: $isBinding, content: {
            PokemonDetailView(currentURL: $currentURL)
        })
        

    }
}

#Preview {
    ContentView()
}

//AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(Pokemon.getPokemonIndex(pokemon: pokemon)).png")) { image in
//        if let image = image {
//            image
//                .resizable()
//                .scaledToFit()
//                .frame(width: 100, height: 100)
//        }
//    } placeholder: {
//        ProgressView()
//            .frame(width: 100, height: 100)
//            
//    }
//    .background(.thinMaterial)
//    .clipShape(Circle())
