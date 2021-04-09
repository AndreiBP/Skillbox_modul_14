//
//  FunctionCoreData.swift
//  modul_#14
//
//  Created by Андрей Балобанов on 02.04.2021.
//

import Foundation
import CoreData

class FunctionCoreData {
    
    var newTaskCR = [ToDoCoreData]()
    
    static let sharedCR = FunctionCoreData()
    
    func allObject() {
        do {
            newTaskCR = try TaskTableViewControllerCoreData.contextCoreData.context.fetch(ToDoCoreData.fetchRequest())
        }
        catch {
            // error
        }
    }
    
    func insertText(tasktextField: String) {
        let tk = ToDoCoreData(context: TaskTableViewControllerCoreData.contextCoreData.context)
        tk.task = tasktextField
        do {
            try TaskTableViewControllerCoreData.contextCoreData.context.save()
            allObject()
        }
        catch {}
        }
    
    func taskDeleteInt(task: ToDoCoreData, imageBool: ToDoCoreData) {
        TaskTableViewControllerCoreData.contextCoreData.context.delete(task)
        TaskTableViewControllerCoreData.contextCoreData.context.delete(imageBool)

        do {
            try TaskTableViewControllerCoreData.contextCoreData.context.save()
            allObject()
        }
        catch {
            }
    }
    // добавление в реалм картинки
    func taskSaveImageTable2(imageBool: ToDoCoreData){
        TaskTableViewControllerCoreData.contextCoreData.context.delete(imageBool)
            do {
                try TaskTableViewControllerCoreData.contextCoreData.context.save()
            }
            catch {}
            }
    
    func taskSaveImageTable(Bool1: Bool, index1: Int){
        let c = newTaskCR[index1]
        c.imageBool = Bool1
        do {
            try TaskTableViewControllerCoreData.contextCoreData.context.save()
        }
        catch {}
        }

}
