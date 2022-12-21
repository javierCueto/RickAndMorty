//
//  CharactersViewController.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 20/12/22.
//

import UIKit

protocol CharactersViewControllerCoordinator {
    func didSelectMenuCell(urlDetail: String)
}

final class CharactersViewController: UITableViewController {
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    // MARK: - Helpers
    private func configTableView() {
        tableView.separatorStyle = .none
        tableView.register(
            ItemCharacterTableViewCell.self,
            forCellReuseIdentifier: ItemCharacterTableViewCell.reuseIdentifier)
    }
    // MARK: - Actions
    
}

// MARK: - TableViewDataSource
extension CharactersViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ItemCharacterTableViewCell.reuseIdentifier,
            for: indexPath) as? ItemCharacterTableViewCell
        else {
            return UITableViewCell()
        }
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        10
    }
}
