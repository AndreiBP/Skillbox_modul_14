//
//  ToDoTasks.swift
//  modul_#14
//
//  Created by Андрей Балобанов on 04.03.2021.
//

import RealmSwift
import Foundation
import UIKit

class Tasks: Object {
    
   @objc dynamic var task: String? = " "
   var data1 = NSData()
    var newTask: Results<Tasks>! // массив значений базы данных

    //показ всех обьектов
    func allObject() {
        let realm = try! Realm()
        self.newTask = realm.objects(Tasks.self)
    }
    
    // сохранение редактируемых данны и удаление нажатой ячейки что бы не было копии
    func taskDeleteInt(indexI: Int) {
        let realm = try! Realm()
        try! realm.write {
            let tk = self.newTask[indexI]
            realm.delete(tk) }
    }
    
    //кнопка сохранения и редактирования старого(нового) значения в базу данных
    func insertText(tasktextField: String) {
        let b = tasktextField
        let tk = Tasks()
        tk.task = b
                let realm = try! Realm()
                try! realm.write {
                    realm.add(tk)
            }
        }
    
    
    // добавление в реалм картинки
    func taskSaveCheckmark() {
       
        let d = NSData(data: #imageLiteral(resourceName: "galka2").pngData()!)
        let workout = newTask.first
                let realm = try! Realm()
                try! realm.write {
                    workout?.data1 = d
                    print(d)
                }}

    }

