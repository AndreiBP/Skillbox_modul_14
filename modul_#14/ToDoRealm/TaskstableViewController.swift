//
//  TaskstableViewController.swift
//  modul_#14
//
//  Created by Андрей Балобанов on 04.03.2021.
//
import UIKit

class TaskstableViewController: UITableViewController {
       
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    //let taskNew = Tasks() //доступ к классу Realm
   
    let realData = functionTask.shared
    
    var index = 0 // индекс нажатой ячейки
        
    override func viewDidLoad() {
        super.viewDidLoad()
        realData.allObject()
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
            guard let source = unwindSegue.source as? ToDoSecondVC else { return }
            source.SaveButton(Any.self)
        }
        
    // сохранение редактируемых данных и удаление нажатой ячейки что бы не было копии
        else { if unwindSegue.identifier == "show3" {
            guard let source = unwindSegue.source as? ToDoSecondVC else { return }
           source.insertButton(Any.self)
            functionTask.shared.taskDeleteInt(indexI: index)
            //taskNew.taskDeleteInt(indexI: index)
            }
        }
    }
    
    // количество строк
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return realData.newTask.count
    }

    // обычное заполнение таблицы существующими значениями
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let task = self.realData.newTask[indexPath.row].task
        cell.textLabel?.text = task
            let task2 = self.realData.newTask[indexPath.row].imageBool
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
            functionTask.shared.taskSaveImageTable(Bool1: true, index1: indexPath.row)
                tableView.reloadData()
            }  else {
                cell?.imageView?.image = .none
                functionTask.shared.taskSaveImageTable(Bool1: false, index1: indexPath.row)
                tableView.reloadData()
            }
        }
        performed.backgroundColor = .darkGray
        
        let performed1 = UIContextualAction(style: .destructive, title: "Удалить") {  (contextualAction, view , boolValue) in
            functionTask.shared.taskDeleteInt(indexI: indexPath.row)
            let cell = tableView.cellForRow(at: indexPath)
            cell?.imageView?.image = .none
          tableView.reloadData()
        }
        let swipeActions = UISwipeActionsConfiguration(actions: [performed, performed1])
        return swipeActions
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
       //передача содержимого нажатой ячейки в textField контроллера ToDoSecondVC
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let todoSecondVC = storyboard.instantiateViewController(identifier: "aaa") as? ToDoSecondVC else { return }
        let nT = realData.newTask[indexPath.row]
        index = indexPath.row
        todoSecondVC.tTV = nT.task ?? "nil"
        show(todoSecondVC, sender: nil)
        print(nT)
        todoSecondVC.writeSaveButtonOutlet()
        tableView.deselectRow(at: indexPath, animated: true)
       
    }
}
                

