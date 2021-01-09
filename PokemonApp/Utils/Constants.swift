//
//  Constants.swift
//  PokemonApp
//
//  Created by Kevinho Morales on 8/1/21.
//

import Foundation

struct Constants {
    
    static let pokedexBaseURL = "https://pokeapi.co/api/v2/"
    struct EndPoints {
        static let pokemonData = pokedexBaseURL + "ability/solar-power"
        static let pokemonDescription = pokedexBaseURL + "pokemon-species/"
        static let pokemonSkills = pokedexBaseURL + "pokemon/"
    }
}
