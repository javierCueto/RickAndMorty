//
//  ItemLocationViewModel.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 06/02/23.
//

struct ItemLocationViewModel {
    private(set) var location: Location
    
    var name: String {
        location.name
    }
    
    //TODO: - Remove strings and use AppLocalized
    var dimension: String {
        let safeDimension = location.dimension ?? AppLocalized.unknown
        return "Dimension: \(safeDimension)"
    }
    
    var type: String {
        let safeType = location.type ?? AppLocalized.unknown
        return "Type: \(safeType)"
    }
}
