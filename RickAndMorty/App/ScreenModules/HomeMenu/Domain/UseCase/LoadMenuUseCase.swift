//
//  LoadMenuUseCase.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 12/11/22.
//

protocol LoadMenuUseCase {
    func execute() async -> Result<[MenuItem], Error>
}

struct LoadMenuUseCaseImp: LoadMenuUseCase {
    
    let menuRepository: MenuRepository
    
    func execute() async -> Result<[MenuItem], Error> {
        do {
            let repositoryResult = try await menuRepository.fetchMenuData()
            return .success(repositoryResult)
        } catch {
            return .failure(error)
        }
    }
}
