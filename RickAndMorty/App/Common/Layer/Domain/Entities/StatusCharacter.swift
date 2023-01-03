//
//  StatusCharacter.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 02/01/23.
//

enum StatusCharacter: String {
    case alive
    case dead
    case unknown
    
    init?(status: String?) {
        guard
            let status = StatusCharacter(rawValue: status?.lowercased() ?? .empty)
        else {
            return nil
        }
        self = status
    }
}

extension StatusCharacter: CustomStringConvertible {
    var description: String {
        switch self {
        case .alive:
            return AppLocalized.statusAlive
        case .dead:
            return AppLocalized.statusDead
        case .unknown:
            return AppLocalized.statusUnknown
        }
    }
}
