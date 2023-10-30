//
//  ContentView.swift
//  PokemonApi
//
//  Created by Christopher Woods on 10/26/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var Pokemon = PokemonViewModel()
    @State var isShowing = false
    @State var currentURL = ""
    @State var currentImage = ""
    @State var currentName = ""
    @State var statsArray: [Int] = []
    

    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    var body: some View {
        ZStack{
            ScrollView{
                LazyVGrid(columns: columns, spacing:20){
                    ForEach(Pokemon.pokemons) { pokemon in
                        VStack{
                            
                            Text(pokemon.name)
                            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(Pokemon.getPokemonIndex(pokemon: pokemon)).png"))
                            
                            
                        }
                        .onTapGesture{
                            statsArray = []
                            Pokemon.setCurrent(current: Pokemon.getPokemonIndex(pokemon: pokemon))
                            Pokemon.fetchDetails {
                                
                                    for stats in Pokemon.stats {
                                        statsArray.append(stats.base_stat)
                                    }
                        }
                        
                                
                            currentImage = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(Pokemon.getPokemonIndex(pokemon: pokemon)).png"
                            currentName = pokemon.name
                            
                            isShowing.toggle()
                            
                        }
                        
                    }
                }
                
            }.blur(radius: isShowing ? 20 : 0)
                .padding()
            
            if isShowing{
                PokemonDetailView(currentURL: .constant("None"), isShowing: $isShowing, name: currentName, image: currentImage, statsArray: $statsArray)
                
            }
        }
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

