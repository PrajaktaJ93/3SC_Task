//
//  PokemonListViewController.swift
//  3SC_Task
//
//  Created by Prajakta on 04/04/23.
//

import UIKit

class PokemonListViewController: UIViewController {
    
    var nextPageUrl: String?
    var isStartedSearch = false
    var arrPokemon = [Pokemon]()
    var arrSearchedPokemon = [Pokemon]()
    var pokemon: Pokemon?
    
    @IBOutlet weak var pokemonListTableView: UITableView!
    @IBOutlet weak var pokemonSearchBar: UISearchBar!
    @IBOutlet weak var resultNotFoundLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonListTableView.register(UINib.init(nibName: "PokemonListTableViewCell", bundle: nil),
                                           forCellReuseIdentifier: "PokemonListTableViewCell")
        navigationItem.title = AppStrings.Pokemon.pokemonNavigationTitle
        pokemonSearchBar.placeholder = AppStrings.Pokemon.searchBarPlaceholder
        resultNotFoundLbl.text = AppStrings.Pokemon.searchDataNotAvailable
        callPokemonList(nextPageurl: Application.URLs.getPokemonData)
    }
    
    func callPokemonList(nextPageurl: String = "") {
        PokemonService().getPokemonList(nextPageurl: nextPageurl,
                                        completionBlock: { model, statusCode in
            if let model = model, let results = model.results {
                
                if let nextPageurl = model.next {
                    self.nextPageUrl = nextPageurl
                } else { self.nextPageUrl = "" }

                for result in results {
                    if !self.arrPokemon.contains(where: { $0.url! == result.url! }) {
                        self.arrPokemon.append(result)
                    }
                }
            }
            DispatchQueue.main.async {
                self.pokemonListTableView.reloadData()
            }
        })
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case Application.SegueIds.segueToPokemonDetailVC:
            if let destinationViewController = segue.destination as? PokemonDetailsViewController {
                destinationViewController.pokemon = pokemon
            }
        default:
            break
        }
    }
}

extension PokemonListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return isStartedSearch ? arrSearchedPokemon.count : arrPokemon.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonListTableViewCell",
                                                 for: indexPath) as! PokemonListTableViewCell
        let pokemon = isStartedSearch ? arrSearchedPokemon[indexPath.row] : arrPokemon[indexPath.row]
        cell.setupCell(pokemon: pokemon)
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        pokemon = isStartedSearch ? arrSearchedPokemon[indexPath.row] : arrPokemon[indexPath.row]
        performSegue(withIdentifier:Application.SegueIds.segueToPokemonDetailVC, sender: self)
    }
    
    func tableView(_ tableView: UITableView,
                   willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
        if (indexPath.row == arrPokemon.count - 1 && nextPageUrl != "") {
            callPokemonList(nextPageurl: nextPageUrl ?? "")
        }
    }
}
extension PokemonListViewController: UISearchBarDelegate {
    
    func searchPokemon(text: String) {
        if text != "" {
            arrSearchedPokemon.removeAll()
            arrSearchedPokemon = arrPokemon.filter({ $0.name!.lowercased().contains(text.lowercased()) })
        } else {
            isStartedSearch = false
        }
        pokemonListTableView.reloadData()
        if arrSearchedPokemon.count == 0 {
            pokemonListTableView.isHidden = true
            resultNotFoundLbl.isHidden = false
        } else {
            pokemonListTableView.isHidden = false
            resultNotFoundLbl.isHidden = true
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        isStartedSearch = true
        searchPokemon(text: searchText)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        pokemonSearchBar.resignFirstResponder()
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
