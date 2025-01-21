//
//  CategoryList+CoreDataProperties.swift
//  CarAppProgrammatic
//
//  Created by Mac on 21.01.25.
//
//

import Foundation
import CoreData


extension CategoryList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryList> {
        return NSFetchRequest<CategoryList>(entityName: "CategoryList")
    }

    @NSManaged public var image: String?
    @NSManaged public var isSelected: Bool
    @NSManaged public var name: String?
    @NSManaged public var size: String?

}

extension CategoryList : Identifiable {

}
