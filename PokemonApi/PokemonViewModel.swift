//
//  PokemonViewModel.swift
//  PokemonApi
//
//  Created by Christopher Woods on 10/26/23.
//

import Foundation

class PokemonViewModel: ObservableObject{
    @Published var pokemons = [Pokemon]()
    @Published var stats = [Stat]()
    @Published var currentNumber = 1
    
    
    private let service = PokemonDataService()
    init() {
        fetchPokemon()
    }
    
    func fetchPokemon() {
        service.fetchPokemon() { pokemonArray in
            DispatchQueue.main.async{
                self.pokemons = pokemonArray
            }
        }
        
    }
    func setCurrent(){
        service.setPokemon(current: currentNumber)
    }
    func fetchDetails(){
        service.fetchDetails(){
            pokemonDetails in
            DispatchQueue.main.async{
                self.stats = pokemonDetails
            }
        }
    }
    
    func getPokemonIndex(pokemon: Pokemon) -> Int {
        if let index = self.pokemons.firstIndex(of: pokemon) {
            return index + 1
        }
        return 0
    }
    
}
//            for x in 0..<pokemonArray.count {
//                print(pokemonArray[x].name)
//            }
