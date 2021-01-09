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
    @IBOutlet weak var pokemonSearch: UISearchBar!
    
    private var pokemonsData = [Pokemon]()
    public var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pokedex"
        setUpCollectionViewCell()
        setUpData()
        // Do any additional setup after loading the view.
    }
    
    private func setUpView() {
        pokemonSearch.placeholder = "Pokemon"
    }
    
    private func setUpCollectionViewCell() {
        let cell = UINib(nibName: "PokedexCollectionViewCell", bundle: nil)
        self.pokemonCollectionView.register(cell, forCellWithReuseIdentifier: "pokemonCell")
    }
    
    private func setUpData() {
        for i in 0...151 {
            var pokemon = Pokemon()
            if i < 10 {
                pokemon = Pokemon(name: "\(i)", image: "00\(i)")
            } else if i < 100 {
                pokemon = Pokemon(name: "\(i)", image: "0\(i)")
            } else {
                pokemon = Pokemon(name: "\(i)", image: "\(i)")
            }
            pokemonsData.append(pokemon)
        }
    }
    
}

extension PokedexViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pokemon = pokemonsData[indexPath.row]
        coordinator?.showPokemonDetail(pokemon: pokemon)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemonCell", for: indexPath) as? PokedexCollectionViewCell
        let pokemon = pokemonsData[indexPath.row]
        cell?.setUpCell(poken: pokemon)
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(#function)
        let padding: CGFloat =  50
        let collectionViewSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }
    
}
