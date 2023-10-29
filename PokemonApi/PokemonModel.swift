//
//  PokemonModel.swift
//  PokemonApi
//
//  Created by Christopher Woods on 10/26/23.
//

import Foundation


struct PokemonResponse: Codable {
    let results: [Pokemon]
}

struct Pokemon: Codable, Identifiable, Equatable {
    let id = UUID()
    let name: String
    let url: String
    
}



struct PokemonStats: Codable {
    let stats: [Stat]
}

struct Stat: Codable {
    let base_stat: Int
    let stat: StatDetails
}

struct StatDetails: Codable {
    let name: String
    let url: String
}
