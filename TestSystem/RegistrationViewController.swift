//
//  RegistrationViewController.swift
//  TestSystem
//
//  Created by Валерия Маслова on 15/06/2019.
//  Copyright © 2019 Shurumov Maxim. All rights reserved.
//

import UIKit
import RealmSwift

class RegistrationViewController: UIViewController {

    var users: Results<User>!
    
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var repeatPassTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!
    @IBOutlet weak var registrButton: UIButton!
    
    var logins: [String] = []
    var currentUser: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        users = realm.objects(User.self)
        
        
        
        for user in users {
            logins.append(user.login)
        }
        
        if currentUser != nil {
            registrButton.isEnabled = false
        } else {
            registrButton.isEnabled = true
        }
        
        photoImage.isUserInteractionEnabled = true
        photoImage.layer.borderWidth = 1
        photoImage.layer.borderColor = UIColor.black.cgColor
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(imageTapped(tapGestureRecognizer:)))
        photoImage.addGestureRecognizer(tapGestureRecognizer)
        
        loginTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        passTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        repeatPassTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        nameTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        secondNameTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
        if currentUser != nil {
            guard let data = currentUser!.photoUser, let image = UIImage(data: data) else { return }
            
            photoImage.image = image
            loginTextField.text = currentUser!.login
            passTextField.text = currentUser!.pass
            repeatPassTextField.text = currentUser!.pass
            nameTextField.text = currentUser!.name
            secondNameTextField.text = currentUser!.secondName
            
            navigationItem.leftBarButtonItem = nil
            registrButton.setTitle("Изменить", for: .normal)
        }
  
    }
    
    func saveNewUser() {

        let imageData = photoImage.image?.pngData()
        
        let newUser = User(photoUser: imageData,
                           login: loginTextField.text!,
                           pass: passTextField.text!,
                           name: nameTextField.text!,
                           secondName: secondNameTextField.text!,
                           level: "Junior")
        StorageManager.saveUser(newUser)

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func registration(_ sender: UIButton) {
        if currentUser == nil {
            performSegue(withIdentifier: "newUser", sender: nil)
        } else {
            let imageData = photoImage.image?.pngData()
            try! realm.write {
                currentUser!.photoUser = imageData
                currentUser!.login = loginTextField.text!
                currentUser!.pass = passTextField.text!
                currentUser!.name = nameTextField.text!
                currentUser!.secondName = secondNameTextField.text!
            }
            registrButton.setTitle("Зарегистрировать", for: .normal)
            performSegue(withIdentifier: "toChoiceTest", sender: nil)
        }
    }
}

extension RegistrationViewController: UITextFieldDelegate {
    
    @objc private func textFieldChanged() {
        
        if(loginTextField.text?.isEmpty == false &&
            passTextField.text?.isEmpty == false &&
            nameTextField.text?.isEmpty == false &&
            secondNameTextField.text?.isEmpty == false &&
            repeatPassTextField.text?.isEmpty == false &&
            repeatPassTextField.text == passTextField.text) {
            
            registrButton.isEnabled = true
        } else {
            registrButton.isEnabled = false
        }
        
        if(repeatPassTextField.text != passTextField.text) {
            repeatPassTextField.backgroundColor = .red
        } else  if repeatPassTextField.text == ""{
            repeatPassTextField.backgroundColor = .white
        } else {
            repeatPassTextField.backgroundColor = .green
        }
        
        for login in logins {
            if(loginTextField.text == login) {
                print(login)
                loginTextField.backgroundColor = .red
                break
            } else if loginTextField.text == ""{
                loginTextField.backgroundColor = .white
            } else {
                loginTextField.backgroundColor = .green
            }
        }
                
    }
}

extension RegistrationViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        photoImage.image = info[.editedImage] as? UIImage
        photoImage.contentMode = .scaleAspectFill
        photoImage.clipsToBounds = true
        dismiss(animated: true, completion: nil)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        
        //let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        let cameraIcon = #imageLiteral(resourceName: "camera")
        let photoIcon = #imageLiteral(resourceName: "photo")
        
        let actionSheet = UIAlertController(title: nil,
                                            message: nil,
                                            preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Camera",
                                   style: .default) { _ in
                                    self.chooseImagePicker(source: .camera)
        }
        camera.setValue(cameraIcon, forKey: "Image")
        
        let photo = UIAlertAction(title: "Photo",
                                  style: .default) { _ in
                                    self.chooseImagePicker(source: .photoLibrary)
        }
        photo.setValue(photoIcon, forKey: "Image")
        
        let cancel = UIAlertAction(title: "Cancel",
                                   style: .cancel)
        actionSheet.addAction(camera)
        actionSheet.addAction(photo)
        actionSheet.addAction(cancel)
        
        present(actionSheet,animated: true)
    }
}
