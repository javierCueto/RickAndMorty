//
//  LocationViewModel.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 06/02/23.
//

import Combine

protocol LocationViewModel: BaseViewModel {
    var itemsLocationCount: Int { get }
    var lastPage: Bool { get }
    func getItemLocationViewModel(row: Int) -> ItemLocationViewModel
}

final class LocationViewModelImp: LocationViewModel {
    
    
    // MARK: - Internal properties
    var itemsLocationCount: Int {
        locations.count
    }
    
    var lastPage: Bool {
        lastPageUseCase.lastPage
    }
    
    var state: PassthroughSubject<StateController, Never>
    
    // MARK: - Private properties
    private var loadLocationUseCase: LoadLocationsUseCase
    private var lastPageUseCase: LastPageValidationUseCase
    private var locations: [Location] = []
    // MARK: - Life Cycle
    init(
        state: PassthroughSubject<StateController, Never>,
        loadLocationUseCase: LoadLocationsUseCase,
        lastPageUseCase: LastPageValidationUseCase
    ){
        self.state = state
        self.loadLocationUseCase = loadLocationUseCase
        self.lastPageUseCase = lastPageUseCase
    }
    
    func viewDidLoad() {
        state.send(.loading)
        Task { [weak self] in
            let result = await loadLocationUseCase.execute()
            switch result {
            case .success(let locations):
                lastPageUseCase.updateLastPage(itemsCount: locations.count)
                self?.locations.append(contentsOf: locations)
                state.send(.success)
            case .failure(let error):
                state.send(.fail(error: error.localizedDescription))
            }
        }
    }
    
    // MARK: - Helpers
    func getItemLocationViewModel(row: Int) -> ItemLocationViewModel {
        checkAndLoadMoreItems(row: row)
        let location = locations[row]
        let itemLocationViewModel = ItemLocationViewModel(location: location)
        return itemLocationViewModel
    }
    
    private func checkAndLoadMoreItems(row: Int) {
        lastPageUseCase.checkAndLoadMoreItems(
            row: row, actualItems: locations.count,
            action: viewDidLoad)
    }
}
