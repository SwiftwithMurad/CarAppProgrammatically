//
//  CarCoreDataHelper.swift
//  CarAppProgrammatic
//
//  Created by Mac on 21.01.25.
//

import Foundation

class CarCoreDataHelper {
    let context = AppDelegate().persistentContainer.viewContext
    var cars = [CarList]()
    
    func fetchCarData(completion: (([CarList]) -> Void)) {
        do {
            cars = try context.fetch(CarList.fetchRequest())
            print(cars)
            completion(cars)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func saveCarData(car: Car) {
        let newCars = CarList(context: context)
        newCars.category = car.category?.name
        newCars.engine = car.engine
        newCars.image = car.image
        newCars.model = car.model
        newCars.name = car.name
        newCars.price = car.price
    }
}
