//
//  PokemonDetailsViewController.swift
//  3SC_Task
//
//  Created by Prajakta on 05/04/23.
//

import UIKit

class PokemonDetailsViewController: UIViewController {

    var pokemon: Pokemon?
    var pokemonDetail: PokemonDetailModel?

    @IBOutlet weak var pokemonDetailTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.pokemonDetailTableView.register(UINib.init(nibName: "PokemonDetailTableViewCell", bundle: nil),
                                             forCellReuseIdentifier: "PokemonDetailTableViewCell")
        PokemonService().getPokemonData(urlString: self.pokemon?.url ?? "",
                                        completionBlock:  { model, statusCode in
            if let model = model {
            self.pokemonDetail = model
            }
            DispatchQueue.main.async {
                self.pokemonDetailTableView.reloadData()
            }
        })
    }
}

extension PokemonDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 200 : UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonDetailTableViewCell",
                                                 for: indexPath) as! PokemonDetailTableViewCell
        if let pokemonDetail = pokemonDetail {
            cell.setupPokemonDetailCell(pokemonDetail: pokemonDetail, indexPath: indexPath)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 3 || indexPath.row == 4 {
            let popupVC = Application.StoryBoard.main
                .instantiateViewController(withIdentifier: Application.StoryBoardIds.popUpViewController) as! PopUpViewController
            popupVC.pokemonDetail = self.pokemonDetail
            popupVC.infoType = indexPath.row == 3 ? Application.Constants.forType : Application.Constants.forMove
            self.present(popupVC, animated: true, completion: nil)
        }
    }
}
