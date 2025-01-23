//
//  HomeReusableView.swift
//  CarAppProgrammatic
//
//  Created by Mac on 21.01.25.
//

import UIKit

class HomeReusableView: UICollectionReusableView {
    var categories = [CategoryList]()
    
    private let headerCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .systemGray5
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private let bottomLabel: UILabel = {
        let label = UILabel()
        label.text = "Available vehicles"
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .black
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
        headerCollection.delegate = self
        headerCollection.dataSource = self
        headerCollection.register(HomeHeaderCell.self, forCellWithReuseIdentifier: "cell")
        [headerCollection, bottomLabel].forEach { addSubview($0) }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            headerCollection.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            headerCollection.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            headerCollection.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            headerCollection.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8),
            
            bottomLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            bottomLabel.topAnchor.constraint(equalTo: headerCollection.bottomAnchor, constant: 24)
        ])
    }
    
    func configCategory(category: [CategoryList]) {
        self.categories = category
    }
}

extension HomeReusableView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeHeaderCell
        cell.configCell(category: categories[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: headerCollection.frame.width / 2.8, height: headerCollection.frame.height)
    }
}
