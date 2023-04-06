//
//  Application.swift
//  3SC_Task
//
//  Created by Prajakta on 05/04/23.
//

import Foundation
import UIKit

/// Application resuable identifiers
struct Application {
    enum StoryBoard {
        static let main = UIStoryboard(name: "Main", bundle: nil)
    }
    
    enum StoryBoardIds {
        static let popUpViewController = "PopUpViewController"
    }
    
    enum SegueIds {
        static let segueToPokemonDetailVC = "SegueToPokemonDetailVC"
    }
    
    enum Constants {
        static let forType = "forType"
        static let forMove = "forMove"
    }
    
    enum URLs {
        static let getPokemonData = "https://pokeapi.co/api/v2/pokemon/"
    }
}
