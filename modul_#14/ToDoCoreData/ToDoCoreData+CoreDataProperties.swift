//
//  ToDoCoreData+CoreDataProperties.swift
//  modul_#14
//
//  Created by Андрей Балобанов on 05.04.2021.
//
//

import Foundation
import CoreData


extension ToDoCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoCoreData> {
        return NSFetchRequest<ToDoCoreData>(entityName: "ToDoCoreData")
    }

    @NSManaged public var task: String?
    @NSManaged public var imageBool: Bool

}

extension ToDoCoreData : Identifiable {

}
