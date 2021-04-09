//
//  TaskTableViewControllerCoreData.swift
//  modul_#14
//
//  Created by Андрей Балобанов on 02.04.2021.
//

import UIKit

class TaskTableViewControllerCoreData: UITableViewController {
    

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    static let contextCoreData = TaskTableViewControllerCoreData()
    
    var coreData1 = FunctionCoreData.sharedCR
    
    var index = 0
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
            coreData1.allObject()
        self.tableView.reloadData()
        }

    // при нажатии на кнопку edit появляется строка удаление
    @IBAction func editButton(_ sender: Any) {
        let edit = !self.tableView.isEditing
        self.tableView.setEditing(edit, animated: true)
    }
    
    // unwingSegue передача данных назад и закрытие контроллера при нажатии кнопок
    @IBAction func addButton(_ unwindSegue: UIStoryboardSegue) {
        if unwindSegue.identifier == "show2" {
            guard let source = unwindSegue.source as? ToDoVCCoreData else { return }
            source.SaveButton(Any.self)
        }
        
    // сохранение редактируемых данных и удаление нажатой ячейки что бы не было копии
        else { if unwindSegue.identifier == "show3" {
            guard let source = unwindSegue.source as? ToDoVCCoreData else { return }
           source.insertButton(Any.self)
            let nT = coreData1.newTaskCR[index]
            FunctionCoreData.sharedCR.taskDeleteInt(task: nT, imageBool: nT)
            tableView.reloadData()
            }
        }
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreData1.newTaskCR.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)

        let task = self.coreData1.newTaskCR[indexPath.row].task
        cell.textLabel?.text = task
        let task2 = self.coreData1.newTaskCR[indexPath.row].imageBool
        if  task2 == true {
                cell.imageView?.image = UIImage(named: "galka2")
            }

        return cell
    }
    //свайп справа "удаления", установил так же отметку "выполнено"
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
                
        let performed = UIContextualAction(style: .destructive, title: "Выполнено") {  (contextualAction, view , boolValue) in
            
            let cell = tableView.cellForRow(at: indexPath)
            
            if  cell?.imageView?.image == .none {
                cell?.imageView?.image = UIImage(named: "galka2")
                FunctionCoreData.sharedCR.taskSaveImageTable(Bool1: true, index1: indexPath.row)
                tableView.reloadData()
            }  else {
                cell?.imageView?.image = .none
                FunctionCoreData.sharedCR.taskSaveImageTable(Bool1: false, index1: indexPath.row)
                tableView.reloadData()
            }
        }
        performed.backgroundColor = .darkGray
        
        let performed1 = UIContextualAction(style: .destructive, title: "Удалить") {  (contextualAction, view , boolValue) in
            
            let cell = tableView.cellForRow(at: indexPath)
            let nT = self.coreData1.newTaskCR[indexPath.row]
            
            FunctionCoreData.sharedCR.taskDeleteInt(task: nT, imageBool: nT)
           
            cell?.imageView?.image = .none
            tableView.reloadData()
        }
        let swipeActions = UISwipeActionsConfiguration(actions: [performed, performed1])
        return swipeActions
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
       //передача содержимого нажатой ячейки в textField контроллера ToDoVCCoreData
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let todoVCCoreData = storyboard.instantiateViewController(identifier: "ccc") as? ToDoVCCoreData else { return }
        let nT = coreData1.newTaskCR[indexPath.row]
        index = indexPath.row
        todoVCCoreData.tTV = nT.task ?? "nil"
        show(todoVCCoreData, sender: nil)
        print(nT)
        todoVCCoreData.writeSaveButtonOutlet()
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
    }
}
