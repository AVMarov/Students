//
//  ViewController.swift
//  Students
//
//  Created by 1 on 02.04.2020.
//  Copyright © 2020 example. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let students = [
    Students(name: "Иван", surname: "Иванов", age: 18, rating: 10),
    Students(name: "Петр", surname: "Смирнов", age: 19, rating: 9),
    Students(name: "Алексей", surname: "Сидоров", age: 20, rating: 8),
    Students(name: "Александр", surname: "Петров", age: 21, rating: 7),
    Students(name: "Владимир", surname: "Кузнецов", age: 22, rating: 6),
    Students(name: "Петр", surname: "Иванов", age: 23, rating: 5),
    Students(name: "Владимир", surname: "Смирнов", age: 24, rating: 4),
    Students(name: "Александр", surname: "Сидоров", age: 25, rating: 9),
    Students(name: "Алексей", surname: "Петров", age: 26, rating: 6),
    Students(name: "Иван", surname: "Кузнецов", age: 27, rating: 7)
    ]

    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath)
        cell.textLabel?.text = students[indexPath.row].getFullName()
        return cell
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

