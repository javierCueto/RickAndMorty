//
//  HomeMenuController.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 10/11/22.
//

import UIKit
import Combine

protocol HomeMenuViewControllerCoordinator: AnyObject {
    func didSelectMenuCell(model: MenuItem)
}

final class HomeMenuController: UICollectionViewController {
    
    private let viewModel: HomeMenuViewModel
    private var cancellable = Set<AnyCancellable>()
    private weak var coordinator: HomeMenuViewControllerCoordinator?
    
    init(
        viewModel: HomeMenuViewModel,
        layout: UICollectionViewFlowLayout,
        coordinator: HomeMenuViewControllerCoordinator
    ) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configCollectionView()
        stateController()
        viewModel.viewDidLoad()
    }
    
    private func stateController() {
        viewModel
            .state
            .receive(on: RunLoop.main)
            .sink { [weak self] state in
                self?.hideSpinner()
                switch state {
                case .success:
                    self?.collectionView.reloadData()
                case .loading:
                    self?.showSpinner()
                case .fail(error: let error):
                    self?.presentAlert(message: error, title: "Error")
                }
            }.store(in: &cancellable)
    }
    
    private func configUI() {
        view.backgroundColor = .systemBackground
    }
    
    private func configCollectionView() {
        collectionView.register(ItemHomeMenuCell.self, forCellWithReuseIdentifier: ItemHomeMenuCell.reuseIdentifier)
    }
    
}


extension HomeMenuController {
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ItemHomeMenuCell.reuseIdentifier,
                for: indexPath
            ) as? ItemHomeMenuCell
        else { return UICollectionViewCell() }
        
        let viewModelCell = viewModel.getItemMenuViewMode(indexPath: indexPath)
        cell.configData(viewModel: viewModelCell)
        
        return cell
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        viewModel.menuItemsCount
    }
}

extension HomeMenuController {
    override func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        let model = viewModel.getMenuItem(indexPath: indexPath)
        coordinator?.didSelectMenuCell(model: model)
    }
}

extension HomeMenuController: SpinnerDisplayable { }

extension HomeMenuController: MessageDisplayable { }
