//
//  PokemonSkillsTableViewCell.swift
//  PokemonApp
//
//  Created by Kevinho Morales on 8/1/21.
//

import UIKit

class PokemonSkillsTableViewCell: UITableViewCell {

    @IBOutlet weak var skills: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setUpCell(poken: Skills) {
        skills.text = poken.abilities[0].ability.name
    }
}
