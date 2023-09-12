//
//  Student+CoreDataProperties.swift
//  SingleValueStore_CoreData_iOS_UIKit
//
//  Created by Jogender Singh on 12/09/23.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?

}

extension Student : Identifiable {

}
