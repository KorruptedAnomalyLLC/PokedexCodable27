//
//  Pokemon.swift
//  PokedexCodable27
//
//  Created by Austin West on 6/25/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import UIKit

struct Pokemon: Decodable {
    
    let name: String
    let id: Int
    let abilities: [AbilityDictionary]
    let sprites: SpritesDictionary
}

struct SpritesDictionary: Decodable {
    let image: URL
    
    private enum CodingKeys: String, CodingKey {
        case image = "front_shiny"
    }
}

struct AbilityDictionary: Decodable {
    
    let ability: Ability
    
    struct Ability: Decodable {
        let name: String
    }
}
