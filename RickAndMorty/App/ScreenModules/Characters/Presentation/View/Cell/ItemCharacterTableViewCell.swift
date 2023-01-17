//
//  ItemCharacterTableViewCell.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 20/12/22.
//

import UIKit

final class ItemCharacterTableViewCell: UITableViewCell {
    // MARK: - Private properties
    private let mainContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .tertiarySystemGroupedBackground
        view.setHeightConstraint(with: ViewValues.defaultHeightContainerCell)
        view.layer.cornerRadius = ViewValues.defaultCornerRadius
        view.layer.masksToBounds = true
        return view
    }()
    
    private let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.setWidthConstraint(with: ViewValues.defaultHeightContainerCell)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let labelContainerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(
            forTextStyle: .headline,
            compatibleWith: UITraitCollection(legibilityWeight: .bold))
        label.textColor = .systemBlue
        label.text = "Rick"
        return label
    }()
    
    private let specieLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        label.text = "Human"
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        label.text = "🪦"
        return label
    }()
    
    
    // MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
       
    }
    
    private var task: Task<Void, Never>?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        task?.cancel()
    }
    
    // MARK: - Helpers
    
    private func configUI() {
        selectionStyle = .none
        addSubview(mainContainerView)
        
        mainContainerView.setConstraints(
            top: topAnchor,
            right: rightAnchor,
            bottom: bottomAnchor,
            left: leftAnchor,
            pRight: ViewValues.doublePadding,
            pBottom: ViewValues.doublePadding,
            pLeft: ViewValues.doublePadding)
        
        mainContainerView.addSubview(characterImageView)
        characterImageView.setConstraints(
            top: mainContainerView.topAnchor,
            bottom: mainContainerView.bottomAnchor,
            left: mainContainerView.leftAnchor)
        
        mainContainerView.addSubview(labelContainerStackView)
        labelContainerStackView.setConstraints(
            top: mainContainerView.topAnchor,
            right: mainContainerView.rightAnchor,
            bottom: mainContainerView.bottomAnchor,
            left: characterImageView.rightAnchor,
            pTop: ViewValues.normalPadding,
            pBottom: ViewValues.normalPadding,
            pLeft: ViewValues.normalPadding)
        
        [nameLabel, specieLabel, statusLabel].forEach {
            labelContainerStackView.addArrangedSubview($0)
        }
    }
    
    func configData(viewModel: ItemCharacterViewModel) {
        nameLabel.text = viewModel.name
        specieLabel.text = viewModel.specie
        statusLabel.text = viewModel.status
        setImage(viewModel: viewModel)
    }
    
    private func setImage(viewModel: ItemCharacterViewModel) {
        characterImageView.addDefaultImage()
        if let data = viewModel.imageData {
            characterImageView.setImageFromData(data: data)
        } else {
            task = Task {
                let dataImage = await viewModel.getImageData()
                characterImageView.setImageFromData(data: dataImage)
            }
        }
    }
    
}

// MARK: - Extensions here
extension ItemCharacterTableViewCell: Reusable { }
