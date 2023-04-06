//
//  PokemonDetailModel.swift
//  3SC_Task
//
//  Created by Prajakta on 05/04/23.
//

import Foundation

struct PokemonDetailModel: Codable {
    let abilities: [Ability]?
    let baseExperience: Int?
    let forms: [Species]?
    let gameIndices: [GameIndex]?
    let height: Int?
    let heldItems: [HeldItem]?
    let id: Int?
    let isDefault: Bool?
    let locationAreaEncounters: String?
    let moves: [Move]?
    let name: String?
    let order: Int?
    let pastTypes: [PastType]?
    let species: Species?
    let sprites: Sprites?
    let stats: [Stat]?
    let types: [TypeElement]?
    let weight: Int?
    
    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case forms
        case gameIndices = "game_indices"
        case height
        case heldItems = "held_items"
        case id
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case moves, name, order
        case pastTypes = "past_types"
        case species, sprites, stats, types, weight
    }
}

extension PokemonDetailModel {
    struct PastType: Codable {
        let generation: Species?
        let types: [TypeElement]?
    }
    
    struct VersionDetail: Codable {
        let rarity: Int?
        let version: Species?
    }
    
    struct HeldItem: Codable {
        let item: Species?
        let versionDetails: [VersionDetail]?
        enum CodingKeys: String, CodingKey {
            case item
            case versionDetails = "version_details"
        }
    }
    
    struct Ability: Codable {
        let ability: Species?
        let isHidden: Bool?
        let slot: Int?
        enum CodingKeys: String, CodingKey {
            case ability
            case isHidden = "is_hidden"
            case slot
        }
    }
    
    struct Species: Codable {
        let name: String?
        let url: String?
    }
    
    struct GameIndex: Codable {
        let gameIndex: Int?
        let version: Species?
        enum CodingKeys: String, CodingKey {
            case gameIndex = "game_index"
            case version
        }
    }
    
    struct Move: Codable {
        let move: Species?
        let versionGroupDetails: [VersionGroupDetail]?
        enum CodingKeys: String, CodingKey {
            case move
            case versionGroupDetails = "version_group_details"
        }
    }
    
    struct VersionGroupDetail: Codable {
        let levelLearnedAt: Int?
        let moveLearnMethod, versionGroup: Species?
        enum CodingKeys: String, CodingKey {
            case levelLearnedAt = "level_learned_at"
            case moveLearnMethod = "move_learn_method"
            case versionGroup = "version_group"
        }
    }
    
    struct GenerationV: Codable {
        let blackWhite: Sprites?
        enum CodingKeys: String, CodingKey {
            case blackWhite = "black-white"
        }
    }
    
    struct GenerationIv: Codable {
        let diamondPearl, heartgoldSoulsilver, platinum: Sprites?
        enum CodingKeys: String, CodingKey {
            case diamondPearl = "diamond-pearl"
            case heartgoldSoulsilver = "heartgold-soulsilver"
            case platinum
        }
    }
    
    struct Versions: Codable {
        let generationI: GenerationI?
        let generationIi: GenerationIi?
        let generationIii: GenerationIii?
        let generationIv: GenerationIv?
        let generationV: GenerationV?
        let generationVi: [String: Home]?
        let generationVii: GenerationVii?
        let generationViii: GenerationViii?
        enum CodingKeys: String, CodingKey {
            case generationI = "generation-i"
            case generationIi = "generation-ii"
            case generationIii = "generation-iii"
            case generationIv = "generation-iv"
            case generationV = "generation-v"
            case generationVi = "generation-vi"
            case generationVii = "generation-vii"
            case generationViii = "generation-viii"
        }
    }
    
    class Sprites: Codable {
        let backDefault: String?
        let backFemale: String?
        let backShiny: String?
        let backShinyFemale: String?
        let frontDefault: String?
        let frontFemale: String?
        let frontShiny: String?
        let frontShinyFemale: String?
        let other: Other?
        let versions: Versions?
        let animated: Sprites?
        enum CodingKeys: String, CodingKey {
            case backDefault = "back_default"
            case backFemale = "back_female"
            case backShiny = "back_shiny"
            case backShinyFemale = "back_shiny_female"
            case frontDefault = "front_default"
            case frontFemale = "front_female"
            case frontShiny = "front_shiny"
            case frontShinyFemale = "front_shiny_female"
            case other, versions, animated
        }
    }
    
    struct GenerationI: Codable {
        let redBlue, yellow: RedBlue?
        enum CodingKeys: String, CodingKey {
            case redBlue = "red-blue"
            case yellow
        }
    }
    
    struct RedBlue: Codable {
        let backDefault, backGray, backTransparent, frontDefault: String?
        let frontGray, frontTransparent: String?
        enum CodingKeys: String, CodingKey {
            case backDefault = "back_default"
            case backGray = "back_gray"
            case backTransparent = "back_transparent"
            case frontDefault = "front_default"
            case frontGray = "front_gray"
            case frontTransparent = "front_transparent"
        }
    }
    
    struct GenerationIi: Codable {
        let crystal: Crystal?
        let gold, silver: Gold?
    }
    
    struct Crystal: Codable {
        let backDefault, backShiny, backShinyTransparent, backTransparent: String?
        let frontDefault, frontShiny, frontShinyTransparent, frontTransparent: String?
        enum CodingKeys: String, CodingKey {
            case backDefault = "back_default"
            case backShiny = "back_shiny"
            case backShinyTransparent = "back_shiny_transparent"
            case backTransparent = "back_transparent"
            case frontDefault = "front_default"
            case frontShiny = "front_shiny"
            case frontShinyTransparent = "front_shiny_transparent"
            case frontTransparent = "front_transparent"
        }
    }
    
    struct Gold: Codable {
        let backDefault, backShiny, frontDefault, frontShiny: String?
        let frontTransparent: String?
        enum CodingKeys: String, CodingKey {
            case backDefault = "back_default"
            case backShiny = "back_shiny"
            case frontDefault = "front_default"
            case frontShiny = "front_shiny"
            case frontTransparent = "front_transparent"
        }
    }
    
    struct GenerationIii: Codable {
        let emerald: OfficialArtwork?
        let fireredLeafgreen, rubySapphire: Gold?
        enum CodingKeys: String, CodingKey {
            case emerald
            case fireredLeafgreen = "firered-leafgreen"
            case rubySapphire = "ruby-sapphire"
        }
    }
    
    struct OfficialArtwork: Codable {
        let frontDefault, frontShiny: String?
        enum CodingKeys: String, CodingKey {
            case frontDefault = "front_default"
            case frontShiny = "front_shiny"
        }
    }
    
    struct Home: Codable {
        let frontDefault: String?
        let frontFemale: String?
        let frontShiny: String?
        let frontShinyFemale: String?
        enum CodingKeys: String, CodingKey {
            case frontDefault = "front_default"
            case frontFemale = "front_female"
            case frontShiny = "front_shiny"
            case frontShinyFemale = "front_shiny_female"
        }
    }
    
    struct GenerationVii: Codable {
        let icons: DreamWorld?
        let ultraSunUltraMoon: Home?
        enum CodingKeys: String, CodingKey {
            case icons
            case ultraSunUltraMoon = "ultra-sun-ultra-moon"
        }
    }
    
    struct DreamWorld: Codable {
        let frontDefault: String?
        let frontFemale: String?
        enum CodingKeys: String, CodingKey {
            case frontDefault = "front_default"
            case frontFemale = "front_female"
        }
    }
    
    struct GenerationViii: Codable {
        let icons: DreamWorld?
    }
    
    struct Other: Codable {
        let dreamWorld: DreamWorld?
        let home: Home?
        let officialArtwork: OfficialArtwork?
        enum CodingKeys: String, CodingKey {
            case dreamWorld = "dream_world"
            case home
            case officialArtwork = "official-artwork"
        }
    }
    
    struct Stat: Codable {
        let baseStat, effort: Int?
        let stat: Species?
        enum CodingKeys: String, CodingKey {
            case baseStat = "base_stat"
            case effort, stat
        }
    }
    
    struct TypeElement: Codable {
        let slot: Int?
        let type: Species?
    }
}
