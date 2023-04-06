//
//  PokemonService.swift
//  3SC_Task
//
//  Created by Prajakta on 04/04/23.
//

import Foundation

class PokemonService {
      
    func getPokemonList(nextPageurl: String,
                        completionBlock: @escaping (PokemonList?, Int) -> Void) {
        let url = URL(string: nextPageurl)!
        NetworkUtility.shared.fetchDataFromApiWith(url: url, completionBlock: completionBlock)
    }
    
    func getPokemonData(urlString: String,
                        completionBlock: @escaping (PokemonDetailModel?, Int) -> Void) {
        let url = URL(string: urlString)!
        NetworkUtility.shared.fetchDataFromApiWith(url: url, completionBlock: completionBlock)
    }
}
