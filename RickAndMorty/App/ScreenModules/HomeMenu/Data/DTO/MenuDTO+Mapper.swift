//
//  MenuDTO+Mapper.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 12/11/22.
//

extension MenuDTO {
    func toDomain() -> [MenuItem] {
        return self.dictionaryProperties().map { dictionary in
            let title = dictionary.key
            let url: String = (dictionary.value as? String) ?? String()
            return MenuItem(title: title, url: url)
        }
    }
}
