//
//  PokemonDetailTableViewCell.swift
//  3SC_Task
//
//  Created by Prajakta on 05/04/23.
//

import UIKit

class PokemonDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var infoLblWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var pokemonInfoLbl: UILabel!
    @IBOutlet weak var pokemonSpriteImgView: UIImageView!
    @IBOutlet weak var pokemonDetailLbl: UILabel!
   
    func setupCellForPopup(pokemonDetail: PokemonDetailModel,
                           indexPath: IndexPath,
                           forInfo: String = "") {
        self.pokemonSpriteImgView.isHidden = true
        self.pokemonInfoLbl.isHidden = true
        self.pokemonDetailLbl.isHidden = false

        switch forInfo {
        case Application.Constants.forType:
            self.pokemonDetailLbl.text = pokemonDetail.types![indexPath.row].type?.name ?? ""
        case Application.Constants.forMove:
            self.pokemonDetailLbl.text = pokemonDetail.moves![indexPath.row].move?.name ?? ""
        default:
            break
        }
    }
    
    func setupPokemonDetailCell(pokemonDetail: PokemonDetailModel,
                                indexPath: IndexPath) {
        self.accessoryType = .none
        self.pokemonDetailLbl.isHidden = false
        self.pokemonInfoLbl.isHidden = false
        self.pokemonSpriteImgView.isHidden = true
        
        switch indexPath.row {
        case 0:
            self.pokemonSpriteImgView.isHidden = false
            self.pokemonDetailLbl.isHidden = true
            self.pokemonInfoLbl.isHidden = true
            self.pokemonSpriteImgView.image = AppUtility.shared.loadImage(imageUrlString: pokemonDetail.sprites?.frontDefault)
        case 1:
            self.pokemonDetailLbl.text = AppStrings.Pokemon.pokemonName
            self.pokemonInfoLbl.text = pokemonDetail.name
        case 2:
            self.pokemonDetailLbl.text = AppStrings.Pokemon.pokemonWeight
            self.pokemonInfoLbl.text = String(pokemonDetail.weight ?? 0)
        case 3:
            self.pokemonDetailLbl.text = AppStrings.Pokemon.pokemonTypes
            self.accessoryType = .disclosureIndicator
            self.infoLblWidthConstraint.constant = 0
            self.pokemonInfoLbl.isHidden = true
        case 4:
            self.pokemonDetailLbl.text = AppStrings.Pokemon.pokemonMoves
            self.accessoryType = .disclosureIndicator
            self.infoLblWidthConstraint.constant = 0
            self.pokemonInfoLbl.isHidden = true
        default:
            break
        }
    }
}
