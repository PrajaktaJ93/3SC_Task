//
//  PopUpViewController.swift
//  3SC_Task
//
//  Created by Prajakta on 05/04/23.
//

import UIKit

class PopUpViewController: UIViewController {

    var infoType : String?
    var pokemonDetail: PokemonDetailModel?
    
    @IBOutlet weak var popupTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.popupTableView.register(UINib.init(nibName: "PokemonDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "PokemonDetailTableViewCell")
    }
    
    @IBAction func dismissBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension PopUpViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        switch infoType {
        case Application.Constants.forType:
            return pokemonDetail?.types!.count ?? 0
        case Application.Constants.forMove:
            return pokemonDetail?.moves!.count ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonDetailTableViewCell",
                                                 for: indexPath) as! PokemonDetailTableViewCell
        cell.setupCellForPopup(pokemonDetail: pokemonDetail!,
                               indexPath: indexPath,
                               forInfo: self.infoType ?? "")
        return cell
    }
}
