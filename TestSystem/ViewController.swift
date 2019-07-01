//
//  ViewController.swift
//  TestSystem
//
//  Created by Валерия Маслова on 15/06/2019.
//  Copyright © 2019 Shurumov Maxim. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    var users: Results<User>!
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        users = realm.objects(User.self)
        
        if(users.isEmpty) {
            let image: UIImage? = #imageLiteral(resourceName: "user")
            let imageData = image?.pngData()
            let admin = User(photoUser: imageData,
                             login: "admin",
                             pass: "admin",
                             name: "admin",
                             secondName: "admin",
                             level: "Senior")
            StorageManager.saveUser(admin)
        }

        
        enterButton.layer.borderWidth = 1
        enterButton.layer.borderColor = UIColor.black.cgColor
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toAllTests" {
            let ChoiceTestVC = segue.destination as! ChoiceTestViewController
            for user in users {
                if loginTextField.text == user.login &&
                    passTextField.text == user.pass {
                    ChoiceTestVC.currentUser = user
                    print(user.login)
                }
            }
        }
    }
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        
        guard let registrVC = segue.source as? RegistrationViewController else { return }
        registrVC.saveNewUser()
        
        loginTextField.text = registrVC.loginTextField.text
        passTextField.text = registrVC.passTextField.text
        
    }
    @IBAction func enter(_ sender: UIButton) {
        var count = 0
        for user in users {
            
            if loginTextField.text == user.login &&
                passTextField.text == user.pass {
                loginTextField.placeholder = ""
                performSegue(withIdentifier: "toAllTests", sender: nil)
                break
            }
            count += 1
        }

        if(count == users.count) {
            loginTextField.text = ""
            passTextField.text = ""
            loginTextField.placeholder = "Неверно!"
        }
    }
    
}

