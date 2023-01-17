//
//  ItemCharacterViewModel.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 02/01/23.
//

import Foundation

struct ItemCharacterViewModel {
    private(set) var character: Character
    private(set) var dataImageUseCase: ImageDataUseCase

    var name: String {
        character.name
    }
    
    var specie: String {
        character.specie.description
    }
    
    var status: String {
        character.status?.description ?? ""
    }
    
    var imageData: Data? {
        dataImageUseCase.getDataFromCache(url: URL(
            string: character.urlImage ?? .empty))
    }
    
    func getImageData() async -> Data? {
        let url = URL(string: character.urlImage ?? .empty)
        return await dataImageUseCase.getData(url: url)
    }
}
