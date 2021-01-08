//
//  PokedexViewController.swift
//  PokemonApp
//
//  Created by Kevinho Morales on 8/1/21.
//

import UIKit

class PokedexViewController: UIViewController {

    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    @IBOutlet weak var filterSwitch: UISwitch!
    
    var pokemons = [Pokemon]()
    public var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pokedex"
        setUpCollectionViewCell()
        // Do any additional setup after loading the view.
    }

    private func setUpCollectionViewCell() {
        let cell = UINib(nibName: "PokedexCollectionViewCell", bundle: nil)
        self.pokemonCollectionView.register(cell, forCellWithReuseIdentifier: "pokemonCell")
    }

    private func setUpView() {
        
    }

}

extension PokedexViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemonCell", for: indexPath) as? PokedexCollectionViewCell
        let pokemon = pokemons[indexPath.row]
        cell?.setUpCell(poken: pokemon)
        return cell!
    }
    
}
