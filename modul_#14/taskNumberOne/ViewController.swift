//
//  ViewController.swift
//  modul_#14
//
//  Created by Андрей Балобанов on 04.03.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var sonameText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameText.text = UserDefaultsTaskOne.shared.userName
        print(UserDefaultsTaskOne.shared.userName ?? "нет данных")
        sonameText.text = UserDefaultsTaskOne.shared.userSoName
        print(UserDefaultsTaskOne.shared.userSoName ?? "нет данных")
    }
    
    @IBAction func saveButton(_ sender: Any) {
         UserDefaultsTaskOne.shared.userName = nameText.text
        UserDefaultsTaskOne.shared.userSoName = sonameText.text
    }
    
}

