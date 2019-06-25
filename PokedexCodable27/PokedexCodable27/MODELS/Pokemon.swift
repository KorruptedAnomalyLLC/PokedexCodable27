//
//  Pokemon.swift
//  PokedexCodable27
//
//  Created by Austin West on 6/25/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import Foundation

struct TopLevelDict: Decodable {
    private enum CodingKeys: String, CodingKey {
        case name
        case id
        case abilities
        case spritesDictionary = "sprites"
    }
    
    let name: String
    let id: Int
    let abilities: [AbilityDictionary]
    let spritesDictionary: SpriteDictionary
    
}

struct AbilityDictionary: Decodable {
    let ability: Ability
    
    struct Ability: Decodable {
        let name: String
    }
}

struct SpriteDictionary: Decodable {
    let image: URL
    
    private enum CodingKeys: String, CodingKey {
        case image = "front_shiny"
    }
}
