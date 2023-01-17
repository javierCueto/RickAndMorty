//
//  LocalDataImageService.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 16/01/23.
//

import Foundation

protocol LocalDataImageService {
    func save(key: String, data: Data?)
    func get(key: String) -> Data?
}

struct LocalDataImageServiceImp: LocalDataImageService {
    private var dataStorage = NSCache<NSString, NSData>()
    
    func save(key: String, data: Data?) {
        guard let  data = data else { return }
        dataStorage.setObject(data as NSData, forKey: key as NSString)
    }
    
    func get(key: String) -> Data? {
        dataStorage.object(forKey: key as NSString) as? Data
    }
    
}
