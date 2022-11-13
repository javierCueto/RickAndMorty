//
//  MenuRepositoryImp.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 12/11/22.
//

struct MenuRepositoryImp: MenuRepository {
    
    func fetchMenuData() async throws -> [MenuItem] {
        [MenuItem(title: "locations", url: "nada")]
    }
    
}
