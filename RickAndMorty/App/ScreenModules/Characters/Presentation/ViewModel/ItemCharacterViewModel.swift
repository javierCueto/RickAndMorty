//
//  ItemCharacterViewModel.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 02/01/23.
//

struct ItemCharacterViewModel {
    private let character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    var name: String {
        character.name
    }
    
    var specie: String {
        character.specie.description
    }
    
    var status: String {
        character.status?.description ?? ""
    }
}
