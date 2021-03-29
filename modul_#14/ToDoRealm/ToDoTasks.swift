//
//  ToDoTasks.swift
//  modul_#14
//
//  Created by Андрей Балобанов on 04.03.2021.
//
import RealmSwift
import Foundation
import UIKit

//class Tasks: Object {
class functionTask {
        
   static let shared = functionTask()
    
   var newTask: Results<Tasks>! // массив значений базы данных
    
    //показ всех обьектов
    func allObject() {
        let realm = try! Realm()
        newTask = realm.objects(Tasks.self)
    }
    
    // сохранение редактируемых данны и удаление нажатой ячейки что бы не было копии
    func taskDeleteInt(indexI: Int) {
        let realm = try! Realm()
        try! realm.write {
            let tk = newTask[indexI]
            realm.delete(tk) }
    }
    
    //кнопка сохранения и редактирования старого(нового) значения в базу данных
    func insertText(tasktextField: String) {
        let c = tasktextField
        let tk = Tasks()
        tk.task = c
                let realm = try! Realm()
                try! realm.write {
                    realm.add(tk)
            }
        }
    // добавление в реалм картинки
    func taskSaveImageTable(Bool1: Bool, index1: Int){
        let c = newTask[index1]
        let realm = try! Realm()
        try! realm.write {
            c.imageBool = Bool1
            realm.add(c)
            print(Bool1)
        }
    }
    }

