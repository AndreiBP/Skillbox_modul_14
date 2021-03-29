//
//  ToDoSecondVC.swift
//  modul_#14
//
//  Created by Андрей Балобанов on 06.03.2021. - 16.03.2021.
//

import UIKit

class ToDoSecondVC: UIViewController {
    
    @IBOutlet weak var saveButtonOutlet: UIBarButtonItem!
    @IBOutlet weak var insertButtonoutlet: UIBarButtonItem!
    @IBOutlet weak var taskTextView: UITextView!
    
    var tTV = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTextView.text = tTV
        
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
        functionTask.shared.insertText(tasktextField: taskTextView.text)
        }
   
    // кнопка редактирования значения в базе данных
    @IBAction func insertButton(_ sender: Any) {
        functionTask.shared.insertText(tasktextField: taskTextView.text)
    }

    }


