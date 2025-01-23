//
//  CarsData.swift
//  CarAppProgrammatic
//
//  Created by Mac on 21.01.25.
//
import Foundation

class CarsData {
    let carHelper = CarCoreDataHelper()
    let categoryHelper = CategoryCoreDataHelper()
    let manager = UserDefaultsManager()
    
    func saveData() {
        manager.setValue(value: true, key: .isSaved)
        //save category
        let category1 = CarCategory(name: "Standard", image: "car_1", size: "4")
        categoryHelper.saveData(category: category1)
        let category2 = CarCategory(name: "Prestige", image: "car_2", size: "5")
        categoryHelper.saveData(category: category2)
        let category3 = CarCategory(name: "SUV", image: "car_3", size: "4")
        categoryHelper.saveData(category: category3)
        let category4 = CarCategory(name: "Comfort", image: "car_4", size: "5")
        categoryHelper.saveData(category: category4)
        //------------------------------------------------------------------------------
        //save car
        let car1 = Car(name: "KIA", model: "Stinger", image: "stinger", engine: "6-Cyl 2.5 Liter", price: "$25000", category: category1)
        carHelper.saveCarData(car: car1)
        let car2 = Car(name: "Mercedes", model: "C-class", image: "car_2", engine: "6-Cyl 3.0 Liter", price: "$30000", category: category2)
        carHelper.saveCarData(car: car2)
        let car3 = Car(name: "Jeep", model: "GrandCheeroke", image: "jeep", engine: "8-Cyl 6.2 Liter", price: "$70000", category: category3)
        carHelper.saveCarData(car: car3)
        let car4 = Car(name: "Toyota", model: "Yaris İA", image: "car_4", engine: "4-Cyl 1.5 Liter", price: "$10000", category: category4)
        carHelper.saveCarData(car: car4)
        let car5 = Car(name: "Mercedes", model: "Gt63s", image: "gt63s", engine: "8-Cyl 4.0 Liter", price: "$100000", category: category2)
        carHelper.saveCarData(car: car5)
        let car6 = Car(name: "KIA", model: "K5", image: "k5", engine: "6-Cyl 2.0 Liter Turbo", price: "$25000", category: category1)
        carHelper.saveCarData(car: car6)
        let car7 = Car(name: "BMW", model: "M4 CSL", image: "m4", engine: "6-Cyl 3.0 Liter", price: "$80000", category: category2)
        carHelper.saveCarData(car: car7)
        let car8 = Car(name: "Toyota", model: "GR Corolla", image: "grcorolla", engine: "3-Cyl 1.6 Liter Turbo", price: "$50000", category: category2)
        carHelper.saveCarData(car: car8)
        let car9 = Car(name: "Mercedes", model: "E63 Amg", image: "e63s", engine: "8-Cyl 4.0 Liter", price: "$70000", category: category2)
        carHelper.saveCarData(car: car9)
        let car10 = Car(name: "BMW", model: "M5 competition", image: "m5", engine: "8-Cyl 4.4 Liter", price: "$90000", category: category2)
        carHelper.saveCarData(car: car10)
        let car11 = Car(name: "BMW", model: "M8 competition", image: "m8", engine: "8-Cyl 4.4 Liter", price: "$120000", category: category2)
        carHelper.saveCarData(car: car11)
        let car12 = Car(name: "Jeep", model: "Wrangler", image: "wrangler", engine: "6-Cyl 3.6 Liter", price: "$70000", category: category3)
        carHelper.saveCarData(car: car12)
        let car13 = Car(name: "Mercedes", model: "G63 Amg", image: "g63", engine: "8-Cyl 4.0 Liter", price: "$140000", category: category3)
        carHelper.saveCarData(car: car13)
        let car14 = Car(name: "Toyota", model: "Prius", image: "prius", engine: "3-Cyl 2.0 Liter Hybrid", price: "$40000", category: category4)
        carHelper.saveCarData(car: car14)
        let car15 = Car(name: "BMW", model: "X7 M", image: "x7", engine: "8-Cyl 4.4 Liter", price: "$140000", category: category3)
        carHelper.saveCarData(car: car15)
        let car16 = Car(name: "BMW", model: "M3 Competition", image: "m3", engine: "6-Cyl 3.0 Liter", price: "$90000", category: category2)
        carHelper.saveCarData(car: car16)
    }
}

