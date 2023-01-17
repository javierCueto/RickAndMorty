//
//  LastPageValidationUseCase.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 16/01/23.
//

protocol LastPageValidationUseCase {
    var lastPage: Bool { get }
    mutating func updateLastPage(itemsCount: Int)
    func checkAndLoadMoreItems(
        row: Int,
        actualItems: Int,
        action: () -> Void)
}

struct LastPageValidationUseCaseImp: LastPageValidationUseCase {
    private var threshold = 5
    var lastPage: Bool = false
    
    mutating func updateLastPage(itemsCount: Int) {
        if itemsCount == Int.zero {
            lastPage = true
        }
    }
    
    func checkAndLoadMoreItems(
        row: Int,
        actualItems: Int,
        action: () -> Void
    ) {
        guard !lastPage else { return }
        let limit = actualItems - threshold
        if limit == row {
            action()
        }
    }
}
