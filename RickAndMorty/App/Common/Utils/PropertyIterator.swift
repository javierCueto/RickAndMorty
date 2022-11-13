//
//  PropertyIterator.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 12/11/22.
//

protocol PropertyIterator { }

extension PropertyIterator {
    func dictionaryProperties() -> [String: Any] {
        let mirror = Mirror(reflecting: self)
        var dictionary: [String: Any] = [:]
        
        mirror.children.forEach { property in
            dictionary[property.label ?? String()] = property.value
        }
        
        return dictionary
    }
}
