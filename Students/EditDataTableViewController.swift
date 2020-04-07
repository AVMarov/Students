//
//  EditDataTableViewController.swift
//  Students
//
//  Created by 1 on 07.04.2020.
//  Copyright © 2020 example. All rights reserved.
//

import UIKit

protocol EditStudentDelegate {
    func saveNewProperties()
}

class EditDataTableViewController: UITableViewController {

    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ratingField: UITextField!
    @IBOutlet weak var genderField: UITextField!
    @IBOutlet weak var profileField: UITextField!
    
    
//    @IBOutlet weak var nameCell: UITableViewCell!
//    @IBOutlet weak var ratingCell: UITableViewCell!
//    @IBOutlet weak var genderCell: UITableViewCell!
//    @IBOutlet weak var profileCell: UITableViewCell!
    
    var editStudentDelegate: EditStudentDelegate!
    var student = Student()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        
        //nameCell.isE

        nameField.text = student.fullname
        genderField.text = student.gender ? "Муж" : "Жен"
        ratingField.text = "\(student.rating)"
        profileField.text = student.profile ?? "Нет профиля в соц сетях"
        
        nameField.isEnabled = false
        genderField.isEnabled = false
        ratingField.isEnabled = false
        profileField.isEnabled = false
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Редактировать", style: .plain, target: self, action: #selector(rightButtonTapped))
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: false)
//    }
    
    @objc func rightButtonTapped(button: UIBarButtonItem){
        if button.title! == "Редактировать"{        
            button.title = "Сохранить"
            nameField.isEnabled = true
            genderField.isEnabled = true
            ratingField.isEnabled = true
            profileField.isEnabled = true
        } else if button.title! == "Сохранить"{
            button.title = "Редактировать"
            
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
