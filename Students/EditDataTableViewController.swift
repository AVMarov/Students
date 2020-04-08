//
//  EditDataTableViewController.swift
//  Students
//
//  Created by 1 on 07.04.2020.
//  Copyright © 2020 example. All rights reserved.
//

import UIKit

protocol EditStudentDelegate {
    func saveNewProperties(index: Int, name: String, rating: String, gender: String, prolile: String?)
}

class EditDataTableViewController: UITableViewController, UITextFieldDelegate {

    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ratingField: UITextField!
    @IBOutlet weak var genderField: UITextField!
    @IBOutlet weak var profileField: UITextField!

    
    var editStudentDelegate: EditStudentDelegate!
    var student = Student()
    var index = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        
        nameField.delegate = self
        genderField.delegate = self
        ratingField.delegate = self
        profileField.delegate = self
       
        nameField.text = student.fullname
        genderField.text = student.gender ? "Муж" : "Жен"
        ratingField.text = "\(student.rating)"
        if let website = student.profile {
            profileField.text = website
        } else {
            profileField.text = ""
            profileField.placeholder = "Нет данных о профиле"
        }
        
        
        
        tableView.tableFooterView = UIView()
        
        navigationItem.title = "Данные студента"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Изменить", style: .plain, target: self, action: #selector(rightButtonTapped))
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @objc func rightButtonTapped(button: UIBarButtonItem){
        if button.title! == "Изменить"{
            
            button.title = "Сохранить"
            nameField.isEnabled = true
            genderField.isEnabled = true
            ratingField.isEnabled = true
            profileField.isEnabled = true
        } else if button.title! == "Сохранить"{
            button.title = "Изменить"
            nameField.isEnabled = false
            genderField.isEnabled = false
            ratingField.isEnabled = false
            profileField.isEnabled = false
            
            editStudentDelegate.saveNewProperties(index: index,
                                                  name: nameField.text ?? "",
                                                  rating: ratingField.text ?? "",
                                                  gender: genderField.text ?? "Муж",
                                                  prolile: profileField.text)
            
            self.view.endEditing(true)
        }
    }
    
    
    
}

extension UIViewController{

 func hideKeyboardWhenTappedAround(){
     let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
     tap.cancelsTouchesInView = false
     view.addGestureRecognizer(tap)

 }

 @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}
