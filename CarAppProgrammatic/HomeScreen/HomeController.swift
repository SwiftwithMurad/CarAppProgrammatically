//
//  HomeController.swift
//  CarAppProgrammatic
//
//  Created by Mac on 21.01.25.
//

import UIKit

class HomeController: BaseController {
    let viewModel = HomeViewModel()
    
    private let searchView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 0
        view.layer.cornerRadius = 30
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var searchField: UITextField = {
        let field = UITextField()
        field.placeholder = "Search for a car"
        field.font = .systemFont(ofSize: 14, weight: .regular)
        field.addTarget(nil, action: #selector(fieldConfiguration), for: .editingChanged)
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let searchImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "magnifyingglass")
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let homeCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset.top = 70
        layout.minimumLineSpacing = 70
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .systemGray5
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configUI() {
        title = "Car Rental"
        view.backgroundColor = .systemGray5
        [searchView, homeCollection].forEach { view.addSubview($0) }
        [searchField, searchImage].forEach { searchView.addSubview($0) }
        homeCollection.delegate = self
        homeCollection.dataSource = self
        homeCollection.register(HomeReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        homeCollection.register(CarCategoryCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    override func configConstraints() {
        NSLayoutConstraint.activate([
            searchView.widthAnchor.constraint(equalToConstant: 354),
            searchView.heightAnchor.constraint(equalToConstant: 60),
            searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 36),
            searchView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            searchView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            searchField.centerYAnchor.constraint(equalTo: searchView.centerYAnchor),
            searchField.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 48),
            searchField.widthAnchor.constraint(equalToConstant: 270),
            
            searchImage.widthAnchor.constraint(equalToConstant: 17),
            searchImage.heightAnchor.constraint(equalToConstant: 17),
            searchImage.centerYAnchor.constraint(equalTo: searchField.centerYAnchor),
            searchImage.leadingAnchor.constraint(equalTo: searchField.trailingAnchor, constant: 12),
            
            homeCollection.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 32),
            homeCollection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            homeCollection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            homeCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
    }
    
    @objc func fieldConfiguration() {
        viewModel.configField(search: searchField.text ?? "") {
            self.homeCollection.reloadData()
        }
    }
    
    override func configViewModel() {
        viewModel.fetchData()
    }
}

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CarCategoryCell
        cell.configCell(car: viewModel.cars[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: homeCollection.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! HomeReusableView
        header.configCategory(category: viewModel.categories)
        header.handleCarCategory = { name in
            self.viewModel.cars = self.viewModel.existedCars.filter({ $0.category == name })
            self.homeCollection.reloadData()
        }
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        .init(width: collectionView.frame.width, height: 149)
    }
}
