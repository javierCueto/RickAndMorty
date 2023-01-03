//
//  Specie.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 02/01/23.
//

enum Specie {
    case alien
    case human
    case other(type: String?)
    
    init(specie: String?){
        switch specie {
        case AppLocalized.alien:
            self = .alien
        case AppLocalized.human:
            self = .human
        default:
            self = .other(type: specie)
        }
    }
}

extension Specie: CustomStringConvertible {
    var description: String {
        switch self {
        case .alien:
            return AppLocalized.specieAlien
        case .human:
            return AppLocalized.human
        case .other(let typeSpecie):
            return "\(AppLocalized.specie) \(String(describing: typeSpecie))"
        }
    }
}