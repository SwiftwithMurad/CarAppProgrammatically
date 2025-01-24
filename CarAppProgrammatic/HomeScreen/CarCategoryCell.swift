//
//  CarCategoryCell.swift
//  CarAppProgrammatic
//
//  Created by Mac on 21.01.25.
//

import UIKit

class CarCategoryCell: UICollectionViewCell {
    private let generalView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 0
        view.layer.cornerRadius = 30
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let carImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let carName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let carPrice: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28, weight: .light)
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let carModel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let monthLabel: UILabel = {
       let label = UILabel()
        label.text = "/ month"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let engineLabel: UILabel = {
        let label = UILabel()
        label.text = "Engine"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let engineName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
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
        addSubview(generalView)
        [carImage, carName, carPrice, carModel, monthLabel, engineLabel, engineName].forEach { generalView.addSubview($0) }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            generalView.widthAnchor.constraint(equalToConstant: 450),
            generalView.heightAnchor.constraint(equalToConstant: 350),
            generalView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28),
            generalView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -28),
            generalView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            
            carName.topAnchor.constraint(equalTo: generalView.topAnchor, constant: 36),
            carName.leadingAnchor.constraint(equalTo: generalView.leadingAnchor, constant: 36),
            
            carPrice.topAnchor.constraint(equalTo: generalView.topAnchor, constant: 36),
            carPrice.trailingAnchor.constraint(equalTo: generalView.trailingAnchor, constant: -36),
            
            carModel.topAnchor.constraint(equalTo: carName.bottomAnchor, constant: 4),
            carModel.leadingAnchor.constraint(equalTo: carName.leadingAnchor),
            
            monthLabel.topAnchor.constraint(equalTo: carPrice.bottomAnchor, constant: 4),
            monthLabel.trailingAnchor.constraint(equalTo: carPrice.trailingAnchor),
            
            engineLabel.topAnchor.constraint(equalTo: carModel.bottomAnchor, constant: 4),
            engineLabel.leadingAnchor.constraint(equalTo: carModel.leadingAnchor),
            
            engineName.topAnchor.constraint(equalTo: monthLabel.bottomAnchor, constant: 4),
            engineName.trailingAnchor.constraint(equalTo: monthLabel.trailingAnchor),
            
            carImage.widthAnchor.constraint(equalToConstant: 231),
            carImage.heightAnchor.constraint(equalToConstant: 180),
            carImage.leadingAnchor.constraint(equalTo: generalView.leadingAnchor, constant: 4),
            carImage.trailingAnchor.constraint(equalTo: generalView.trailingAnchor, constant: -4),
            carImage.centerXAnchor.constraint(equalTo: generalView.centerXAnchor),
            carImage.bottomAnchor.constraint(equalTo: generalView.bottomAnchor, constant: -16),
        ])
    }
    
    func configCell(car: CarList) {
        carImage.image = UIImage(named: car.image ?? "")
        carName.text = car.name
        carPrice.text = car.price
        carModel.text = car.model
        engineName.text = car.engine
    }
}
