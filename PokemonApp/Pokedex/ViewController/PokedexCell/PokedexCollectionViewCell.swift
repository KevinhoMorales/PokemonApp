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
        pokemonImage.image = UIImage(named: "001")
    }
    
}
