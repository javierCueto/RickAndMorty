//
//  ItemLocationTableViewCell.swift
//  RickAndMorty
//
//  Created by Javier Cueto on 06/02/23.
//

import UIKit

final class ItemLocationTableViewCell: UITableViewCell {
    // MARK: - Private properties
    private lazy var nameLabel: UILabel = makeLabel(forTextStyle: .headline)
    private lazy var dimensionLabel: UILabel = makeLabel(
        forTextStyle: .subheadline)
    private lazy var typeLabel: UILabel = makeLabel(forTextStyle: .footnote)
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUserInterface()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    private func configUserInterface() {
        selectionStyle = .none
        
        let stack = UIStackView(
            arrangedSubviews: [nameLabel, dimensionLabel, typeLabel])
        stack.axis = .vertical
        stack.spacing = ViewValues.smallPadding
        
        addSubview(stack)
        stack.setConstraints(
            top: topAnchor,
            right: rightAnchor,
            bottom: bottomAnchor,
            left: leftAnchor,
            pTop: ViewValues.normalPadding,
            pRight: ViewValues.normalPadding,
            pBottom: ViewValues.normalPadding,
            pLeft: ViewValues.doublePadding)
        
    }
    
    public func configData(viewModel: ItemLocationViewModel) {
        nameLabel.text = viewModel.name
        dimensionLabel.text = viewModel.dimension
        typeLabel.text = viewModel.type
    }
    
    private func makeLabel(forTextStyle: UIFont.TextStyle) -> UILabel {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: forTextStyle)
        return label
    }

}

extension ItemLocationTableViewCell: Reusable { }
