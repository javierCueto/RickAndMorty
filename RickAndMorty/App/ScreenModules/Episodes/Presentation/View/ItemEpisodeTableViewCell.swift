//
//  ItemEpisodeTableViewCell.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 07/02/23.
//

import UIKit

final class ItemEpisodeTableViewCell: UITableViewCell {
    // MARK: - Private properties
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var numberEpisodeLabel: UILabel = makeCustomPaddingLabel()
    private lazy var airDateLabel: UILabel = makeCustomPaddingLabel()
    private lazy var seasonAndEpisodeLabel: UILabel = makeCustomPaddingLabel()
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUserInterface()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    // TODO: - Remove magic numbers
    private func configUserInterface() {
        let containerTagsStackView = UIStackView(
            arrangedSubviews: [
                numberEpisodeLabel, airDateLabel, seasonAndEpisodeLabel, UIView()
            ])
        containerTagsStackView.spacing = 4
        
        let mainContainerStackView = UIStackView(
            arrangedSubviews: [nameLabel, containerTagsStackView])
        
        mainContainerStackView.axis = .vertical
        mainContainerStackView.spacing = 5
        
        addSubview(mainContainerStackView)
        
        mainContainerStackView.setConstraints(
            top: topAnchor,
            right: rightAnchor,
            bottom: bottomAnchor,
            left: leftAnchor,
            pTop: 10,
            pRight: 10,
            pBottom: 10,
            pLeft: 20)
    }
    
    public func configData(viewModel: ItemEpisodeViewModel) {
        nameLabel.text = viewModel.name
        numberEpisodeLabel.text = viewModel.numberEpisode
        airDateLabel.text = viewModel.airDate
        seasonAndEpisodeLabel.text = viewModel.seasonAndEpisode
    }
    
    // TODO: - Remove magic numbers
    private func makeCustomPaddingLabel() -> UILabel {
        let label = CustomPaddingLabel()
        label.backgroundColor = .systemBlue
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.edgeInset = UIEdgeInsets(top: 2, left: 10, bottom: 2, right: 10)
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.textColor = .white
       return label
    }
}

extension ItemEpisodeTableViewCell: Reusable { }
