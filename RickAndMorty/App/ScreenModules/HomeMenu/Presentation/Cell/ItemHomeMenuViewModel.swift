//
//  ItemHomeMenuViewModel.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 12/11/22.
//

struct ItemHomeMenuViewModel {
    private let menuItem: MenuItem
    
    init(menuItem: MenuItem) {
        self.menuItem = menuItem
    }
    
    var title: String {
        menuItem.title.capitalized
    }
    
    var imageName:String {
        menuItem.title
    }
}
