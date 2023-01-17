//
//  AppContainer.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 16/01/23.
//

protocol AppContainer {
    var apiClient: ApiClientService & RemoteImageDataService { get }
    var localDataService: LocalDataImageService { get }
    func getDatsImageUseCase() -> ImageDataUseCase
}

struct AppContainerImp: AppContainer {
    var apiClient: ApiClientService & RemoteImageDataService = ApiClientServiceImp()
    
    var localDataService: LocalDataImageService = LocalDataImageServiceImp()
    
    func getDatsImageUseCase() -> ImageDataUseCase {
        let imageDataRepository = ImageDataRepositoryImp(
            remoteDataService: apiClient,
            localDataCache: localDataService)
        return ImageDataUseCaseImp(imageDataRepository: imageDataRepository)
    }
    
    
}
