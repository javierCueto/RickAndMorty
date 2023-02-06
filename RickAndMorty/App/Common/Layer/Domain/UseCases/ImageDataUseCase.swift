//
//  ImageDataUseCase.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 16/01/23.
//

import Foundation

protocol ImageDataUseCase {
    func getData(url: URL?) async -> Data?
    func getDataFromCache(url: String?) -> Data?
}

struct ImageDataUseCaseImp: ImageDataUseCase {
    private(set) var imageDataRepository: ImageDataRepository
    
    func getData(url: URL?) async -> Data? {
        await imageDataRepository.fetchData(url: url)
    }
    
    func getDataFromCache(url: String?) -> Data? {
        imageDataRepository.getFromCache(url: url)
    }
}
