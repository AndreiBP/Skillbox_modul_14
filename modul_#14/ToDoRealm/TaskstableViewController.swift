//
//  TaskstableViewController.swift
//  modul_#14
//
//  Created by Андрей Балобанов on 04.03.2021.
//

import UIKit
import RealmSwift

class TaskstableViewController: UITableViewController {
   
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    var newTask: Results<Tasks>! // массив значений базы данных
    
    var a1 = 0 // индекс нажатой ячейки
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = try! Realm()
        self.newTask = realm.objects(Tasks.self)
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
            let realm = try! Realm()
            try! realm.write {
                let tk = self.newTask[a1]
                realm.delete(tk) }
            }
        }
    }
    
    // количество строк
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return newTask.count
    }

    // обычное заполнение таблицы существующими значениями
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let task = self.newTask[indexPath.row].task
        cell.textLabel?.text = task
    return cell
      
    }
    
    // Override to support editing the table view. - редактирование ячейки
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source - удаление ячеек
            let realm = try! Realm()
            try! realm.write {
                let tk = self.newTask[indexPath.row]
                realm.delete(tk) }
            }
        tableView.reloadData()
        }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
       //передача содержимого нажатой ячейки в textField контроллера ToDoSecondVC
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let todoSecondVC = storyboard.instantiateViewController(identifier: "aaa") as? ToDoSecondVC else { return }
        let nT = newTask[indexPath.row]
        a1 = indexPath.row
        todoSecondVC.tTV = nT.task ?? "nil"
        show(todoSecondVC, sender: nil)
        print(nT)
        todoSecondVC.writeSaveButtonOutlet()
    }
}
                

