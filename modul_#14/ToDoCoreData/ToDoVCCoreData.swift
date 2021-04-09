//
//  ToDoVCCoreData.swift
//  modul_#14
//
//  Created by Андрей Балобанов on 02.04.2021.
//

import UIKit

class ToDoVCCoreData: UIViewController {

    @IBOutlet weak var inserBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var saveDarButtonItem: UIBarButtonItem!
    @IBOutlet weak var textViewTaskCR: UITextView!
    
    var tTV = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewTaskCR.text = tTV
    }
    
    // переключения появления кнопок bar
    func writeSaveButtonOutlet() {
        saveDarButtonItem.isEnabled = false
        saveDarButtonItem.title =  ""
        inserBarButtonItem.isEnabled = true
        inserBarButtonItem.title = "Изменить"
    }
    
    // кнопка сохранения нового значения в базу данных
    @IBAction func SaveButton(_ sender: Any) {
        FunctionCoreData.sharedCR.insertText(tasktextField: textViewTaskCR.text)
        }
   
    // кнопка редактирования значения в базе данных
    @IBAction func insertButton(_ sender: Any) {
        FunctionCoreData.sharedCR.insertText(tasktextField: textViewTaskCR.text)
    }
    
}
