//
//  PokemonListTableViewCell.swift
//  3SC_Task
//
//  Created by Prajakta on 04/04/23.
//

import UIKit

class PokemonListTableViewCell: UITableViewCell {

    @IBOutlet weak var pokemonSpriteImageView: UIImageView!
    @IBOutlet weak var pokemonNameLbl: UILabel!

    func setupCell(pokemon: Pokemon) {
        self.pokemonNameLbl.text = pokemon.name
        //To show sprite here, sprite url is not available in api response of list API,
        //which is very much needed in this response.
    }
}
