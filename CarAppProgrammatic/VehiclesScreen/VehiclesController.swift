//
//  VehiclesController.swift
//  CarAppProgrammatic
//
//  Created by Mac on 21.01.25.
//

import UIKit

class VehiclesController: BaseController {
    let carCoreDataHelper = CarCoreDataHelper()
    let categoryCoreDataHelper = CategoryCoreDataHelper()
    let data = CarsData()
    var cars = [CarList]()
    var existedCars = [CarList]()
    var categories = [CategoryList]()
    let manager = UserDefaultsManager()
    
    
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
        field.addTarget(self, action: #selector(fieldConfiguration), for: .editingChanged)
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
        layout.sectionInset.top = 10
        layout.minimumLineSpacing = 70
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .systemGray5
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func fieldConfiguration() {
        if let search = searchField.text?.lowercased() {
            if !search.isEmpty {
                cars = cars.filter({ $0.name?.lowercased().contains(search) ?? false })
                homeCollection.reloadData()
            } else {
                cars = existedCars
                homeCollection.reloadData()
            }
        }
    }
    
    override func configUI() {
        title = "Search"
        view.backgroundColor = .systemGray5
        [searchView, homeCollection].forEach { view.addSubview($0) }
        [searchField, searchImage].forEach { searchView.addSubview($0) }
        homeCollection.delegate = self
        homeCollection.dataSource = self
        homeCollection.register(CarCategoryCell.self, forCellWithReuseIdentifier: "cell")
        fetchData()
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
    
    func fetchData() {
        carCoreDataHelper.fetchCarData { cars in
            self.cars = cars
            self.existedCars = cars
        }
        categoryCoreDataHelper.fetchCategoryData { categories in
            self.categories = categories
        }
    }
}


extension VehiclesController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CarCategoryCell
        cell.configCell(car: cars[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: homeCollection.frame.width, height: 300)
    }
}
