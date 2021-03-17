//
//  ToDoSecondVC.swift
//  modul_#14
//
//  Created by Андрей Балобанов on 06.03.2021. - 16.03.2021.
//

import UIKit
import RealmSwift


class ToDoSecondVC: UIViewController {
       
    @IBOutlet weak var saveButtonOutlet: UIBarButtonItem!
    @IBOutlet weak var insertButtonoutlet: UIBarButtonItem!
    @IBOutlet weak var taskTextView: UITextView!
    
    var tTV = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTextView.text = tTV
        
    }
    
    // функция сохранения нового значения в базу данных
    func saveRealm() {
        let tk = Tasks()
        tk.task = taskTextView.text
                let realm = try! Realm()
                try! realm.write {
                    realm.add(tk)
                    print(tk)
                }
    }
    // переключения появления кнопок bar
    func writeSaveButtonOutlet() {
        saveButtonOutlet.isEnabled = false
        saveButtonOutlet.title =  ""
        insertButtonoutlet.isEnabled = true
        insertButtonoutlet.title = "Изменить"
    }
    
    // кнопка сохранения нового значения в базу данных
    @IBAction func SaveButton(_ sender: Any) {
       saveRealm()
        }
   
    // кнопка редактирования значения в базе данных
    @IBAction func insertButton(_ sender: Any) {
     insertText()
    }
    
    // функция редактирования значения в базе данных
    func insertText() {
        let b = taskTextView.text
        let tk = Tasks()
        tk.task = b
                let realm = try! Realm()
                try! realm.write {
                    realm.add(tk)
            }
        }
    }


