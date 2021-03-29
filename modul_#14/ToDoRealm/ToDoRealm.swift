//
//  ToDoRealm.swift
//  modul_#14
//
//  Created by Андрей Балобанов on 28.03.2021.
//

import Foundation
import RealmSwift

class Tasks: Object {
   
    
    //let b = Realm.Configuration(schemaVersion: 1)
    
   @objc dynamic var task: String? = " "
   @objc dynamic var imageBool = false
    
  // var a = Realm.Configuration.defaultConfiguration.fileURL
}
