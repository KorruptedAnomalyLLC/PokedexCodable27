//
//  PokemonController.swift
//  PokedexCodable27
//
//  Created by Austin West on 6/25/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import UIKit

class PokemonController {
    
    // Singleton
    static let sharedInstance = PokemonController()
    
    //CRUD:
    //Search by ID or by pokemon's name
    func fetchPokemon(searchTerm: String, completion: @escaping (Pokemon?) -> Void) {
        
        // build the url
        guard let baseUrl = URL(string: "https://pokeapi.co/api/v2") else { return }
        // Add components and query items
        let pokemonComponentURL = baseUrl.appendingPathComponent("pokemon")
        //https://pokeapi.co/api/v2/pokemon
        let finalURL = pokemonComponentURL.appendingPathComponent(searchTerm)
        //https://pokeapi.co/api/v2/pokemon/'searchTerm'
        
        // Test the URL
        print(finalURL)
        
        // Start dataTask
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            // check if there is an error
            if let error = error {
                print("There was an errorfetching pokemon  \(searchTerm): \(error)")
                return
            }
            
            // check if there is data
            if let data = data {
                // decode the data
                do {
                    let pokemon =  try JSONDecoder().decode(Pokemon.self, from: data)
                    completion(pokemon)
                } catch {
                    print("Error fetching the Pokemon")
                    completion(nil);return
                }
            }
            }.resume()
    }
    
    func fetchImageFor(pokemon: Pokemon, completion: @escaping (UIImage?) -> Void) {
        let baseURL = pokemon.sprites.image
        
        let dataTask = URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            let image =  UIImage(data: data)
            
            completion(image)
        }
        dataTask.resume()
    }
}
