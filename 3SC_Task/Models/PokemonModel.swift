//
//  PokemonModel.swift
//  3SC_Task
//
//  Created by Prajakta on 04/04/23.
//

import Foundation

typealias Pokemon = PokemonList.Pokemon

struct PokemonList: Codable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [Pokemon]?
}

extension PokemonList {
    struct Pokemon: Codable {
        let name: String?
        let url: String?
    }
}
