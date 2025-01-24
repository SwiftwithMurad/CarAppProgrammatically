//
//  HomeHeaderCell.swift
//  CarAppProgrammatic
//
//  Created by Mac on 21.01.25.
//

import UIKit

class HomeHeaderCell: UICollectionViewCell {
    private let categoryView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 0
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let cellImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let categoryName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let categorySize: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configUI()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configUI() {
        [categoryView, cellImage, categoryName, categorySize].forEach { addSubview($0) }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            categoryView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            categoryView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            categoryView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            categoryView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            cellImage.leadingAnchor.constraint(equalTo: categoryView.leadingAnchor, constant: -32),
            cellImage.topAnchor.constraint(equalTo: categoryView.topAnchor, constant: 4),
            cellImage.widthAnchor.constraint(equalToConstant: 151),
            cellImage.heightAnchor.constraint(equalToConstant: 86),
            
            categoryName.centerXAnchor.constraint(equalTo: categoryView.centerXAnchor),
            categoryName.topAnchor.constraint(equalTo: cellImage.bottomAnchor, constant: 4),
            
            categorySize.centerXAnchor.constraint(equalTo: categoryName.centerXAnchor),
            categorySize.topAnchor.constraint(equalTo: categoryName.bottomAnchor, constant: 4)
        ])
    }
    
    func configCell(category: CategoryList, isSelected: Bool) {
        categoryName.text = category.name
        cellImage.image = UIImage(named: category.image ?? "")
        categorySize.text = category.size
        categoryView.backgroundColor = isSelected ? .systemBlue: .white
        categoryName.textColor = isSelected ? .white: .black
        categorySize.textColor = isSelected ? .white: .black
    }
}
