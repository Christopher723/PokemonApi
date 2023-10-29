//
//  PokemonService.swift
//  PokemonApi
//
//  Created by Christopher Woods on 10/26/23.
//

import Foundation

class PokemonDataService {
    let URLString = "https://pokeapi.co/api/v2/pokemon?limit=151"
    var URL2String = ""
    
    func setPokemon(current: Int){
        URL2String = "https://pokeapi.co/api/v2/pokemon/\(current)/"
    }
    
    func fetchPokemon(completion: @escaping([Pokemon]) -> Void) {
        guard let url = URL(string: URLString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }

            guard let data = data else {
                print("No data received.")
                return
            }

            do {
                let response = try JSONDecoder().decode(PokemonResponse.self, from: data)
                let pokemons = response.results
                
                completion(pokemons)
            } catch {
                print("Error decoding data: \(error)")
            }
            
            
        }.resume()
    }
    func fetchDetails(completion: @escaping([Stat]) -> Void){
        
        guard let url = URL(string: URL2String) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }

            guard let data = data else {
                print("No data received.")
                return
            }

            do {
                let response = try JSONDecoder().decode(PokemonStats.self, from: data)
                let stats = response.stats
                
                completion(stats)
            } catch {
                print("Error decoding data: \(error)")
            }
            
            
        }.resume()
    }
    
    
    
}
