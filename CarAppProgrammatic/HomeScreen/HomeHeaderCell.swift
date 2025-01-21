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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configUI() {
        [categoryView, cellImage, categoryName].forEach { addSubview($0) }
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
        ])
    }
    
    func configCell(category: CategoryList) {
        categoryName.text = category.name
        cellImage.image = UIImage(named: category.image ?? "")
        categorySize.text = category.size
    }
}
