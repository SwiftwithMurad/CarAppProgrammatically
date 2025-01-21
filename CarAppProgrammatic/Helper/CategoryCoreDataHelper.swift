//
//  CoreDataHelper.swift
//  CarAppProgrammatic
//
//  Created by Mac on 21.01.25.
//

import Foundation
import UIKit

class CategoryCoreDataHelper {
    let context = AppDelegate().persistentContainer.viewContext
    var categories = [CategoryList]()
    
    func fetchCategoryData(completion: (([CategoryList]) -> Void)) {
        do {
            categories = try context.fetch(CategoryList.fetchRequest())
            print(categories)
            completion(categories)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func saveData(category: CarCategory) {
        let newCategory = CategoryList(context: context)
        newCategory.image = category.image
        newCategory.name = category.name
        newCategory.size = category.size
        newCategory.isSelected = false
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
