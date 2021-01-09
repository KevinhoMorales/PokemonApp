//
//  MainCoordinator.swift
//  PokemonApp
//
//  Created by Kevinho Morales on 8/1/21.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController = UINavigationController()
    
    func start() {
        let pokedexView = PokedexViewController(nibName: "PokedexViewController", bundle: nil)
        pokedexView.coordinator = self
        navigationController.pushViewController(pokedexView, animated: true)
    }
    
    func showPokemonDetail(pokemon: Pokemon) {
        let pokedexDetail = PokedexDetailViewController(nibName: "PokedexDetailViewController", bundle: nil)
        pokedexDetail.coordinator = self
        pokedexDetail.pokemon = pokemon.name
        navigationController.pushViewController(pokedexDetail, animated: true)
    }

}
