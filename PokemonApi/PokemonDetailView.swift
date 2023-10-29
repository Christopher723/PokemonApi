//
//  PokemonDetailView.swift
//  PokemonApi
//
//  Created by Christopher Woods on 10/27/23.
//

import SwiftUI

struct PokemonDetailView: View {
    @Binding var currentURL: String
    var body: some View {
        Text(currentURL)
    }
}

#Preview {
    PokemonDetailView(currentURL: .constant(""))
}
