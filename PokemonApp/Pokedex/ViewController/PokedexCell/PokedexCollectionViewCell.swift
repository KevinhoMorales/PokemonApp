//
//  PokedexCollectionViewCell.swift
//  PokemonApp
//
//  Created by Kevinho Morales on 8/1/21.
//

import UIKit

class PokedexCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setUpCell(poken: Pokemon) {
        pokemonName.text = "Kevinho"
        for i in 0...151 {
            if i <= 100 {
                pokemonImage.image = UIImage(named: "00\(i)")
            } else {
                pokemonImage.image = UIImage(named: "\(i)")
            }
        }
    }
    
}
