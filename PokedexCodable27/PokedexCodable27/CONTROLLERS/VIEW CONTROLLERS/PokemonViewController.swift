//
//  PokemonViewController.swift
//  PokedexCodable27
//
//  Created by Austin West on 6/25/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {
    
    @IBOutlet weak var spriteImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        //        PokemonController.sharedInstance.fetchPokemon(searchTerm: "1") { (pokemon) in
        //            print(pokemon?.name)
        //        }
        // Do any additional setup after loading the view.
    }
    
    
    func updateViews(pokemon: Pokemon, spriteImage: UIImage) {
        DispatchQueue.main.async {
            self.nameLabel.text = pokemon.name
            self.abilitiesLabel.text = (pokemon.abilities[0].ability.name)
            self.idLabel.text = "\(pokemon.id)"
            self.spriteImageView.image = spriteImage
        }
    }
}// end of class

extension PokemonViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Search for pokemon
        PokemonController.sharedInstance.fetchPokemon(searchTerm: searchText) { (pokemon) in
            guard let pokemon = pokemon else { return }
            PokemonController.sharedInstance.fetchImageFor(pokemon: pokemon, completion: { (image)
                in
                guard let image = image else { return }
                // Update the views
                self.updateViews(pokemon: pokemon, spriteImage: image)
            })
            
        }
    }
}
