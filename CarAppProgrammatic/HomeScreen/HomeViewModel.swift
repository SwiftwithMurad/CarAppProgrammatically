//
//  HomeViewModel.swift
//  CarAppProgrammatic
//
//  Created by Mac on 21.01.25.
//

import Foundation
class HomeViewModel {
    let carCoreDataHelper = CarCoreDataHelper()
    let categoryCoreDataHelper = CategoryCoreDataHelper()
    let data = CarsData()
    var cars = [CarList]()
    var existedCars = [CarList]()
    var categories = [CategoryList]()
    let manager = UserDefaultsManager()
    
    func fetchData() {
        if !manager.getBool(key: .isSaved) {
            data.saveData()
        }
        carCoreDataHelper.fetchCarData { cars in
            self.cars = cars
            self.existedCars = cars
        }
        categoryCoreDataHelper.fetchCategoryData { categories in
            self.categories = categories
        }
    }
    
    func configField(search: String, handleHome: (() -> Void)) {
        let search = search.lowercased()
        if !search.isEmpty {
            cars = cars.filter({ $0.name?.lowercased().contains(search) ?? false })
        } else {
            cars = existedCars
        }
        handleHome()
    }

}
