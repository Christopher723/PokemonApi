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
    @Binding var statsArray: [Int]
    var statLabels = ["HP", "ATK", "SPATK", "DEF", "SPDEF", "Speed"]

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
            HStack{
                VStack(alignment: .leading){
                    
                    ForEach(0..<statsArray.count, id: \.self) { index in
                        HStack{
                            Text(statLabels[index])
                                .font(.caption)
                                .frame(width: 50)
                            Rectangle()
                                .frame(width: CGFloat(statsArray[index]), height: 10)
                                .foregroundColor(Color.blue) // You can change the color as needed
                            Text("\(statsArray[index])")
                        }
                        
                    }
                    
                }
                Spacer()
            }
            .padding()
            Spacer()
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
       PokemonDetailView(currentURL: .constant(""), isShowing: .constant(false), statsArray: .constant([0]))
}
