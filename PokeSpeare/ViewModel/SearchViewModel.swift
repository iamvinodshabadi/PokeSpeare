//
//  SearchViewModel.swift
//  PokeSpeare
//
//  Created by Vinod Shabadi on 21/01/21.
//  Copyright © 2021 True Layer. All rights reserved.
//

import Foundation
import PokeSpeareSDK

protocol SearchViewModelProtocol: class {
    func searchForPokeman(_ name: String)
}

protocol SearchViewModelDelegate: class {
    func pokemonFound(_ model: PokeSpeareModel?)
}

class SearchViewModel: SearchViewModelProtocol {

    var delegate: SearchViewModelDelegate?
    init(_ vmDelegate: SearchViewModelDelegate) {
        delegate = vmDelegate
    }

    func searchForPokeman(_ name: String) {
        PokeSpeareSDK.instance.searchPokemon(name) { [weak self] (model, error) in
            if let model = model {
                self?.delegate?.pokemonFound(model)
            } else {
                self?.delegate?.pokemonFound(nil)
            }
        }
    }
}
