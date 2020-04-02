//
//  ViewController.swift
//  Students
//
//  Created by 1 on 02.04.2020.
//  Copyright © 2020 example. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //Студенты, все персонажи вымышлены любые совпадения случайны
    var students = [
    Students(name: "Иван", surname: "Иванов", age: 18, rating: 10),
    Students(name: "Петр", surname: "Смирнов", age: 19, rating: 9),
    Students(name: "Алексей", surname: "Сидоров", age: 20, rating: 8),
    Students(name: "Александр", surname: "Петров", age: 21, rating: 7),
    Students(name: "Владимир", surname: "Кузнецов", age: 22, rating: 6),
    Students(name: "Петр", surname: "Иванов", age: 23, rating: 5),
    Students(name: "Владимир", surname: "Смирнов", age: 24, rating: 4),
    Students(name: "Александр", surname: "Сидоров", age: 25, rating: 9),
    Students(name: "Алексей", surname: "Петров", age: 26, rating: 6),
    Students(name: "Иван", surname: "Кузнецов", age: 27, rating: 7),
    Students(name: "Константин", surname: "Соколов", age: 28, rating: 10),
    Students(name: "Андрей", surname: "Михайлов", age: 29, rating: 9),
    Students(name: "Дмитрий", surname: "Егоров", age: 30, rating: 8),
    Students(name: "Денис", surname: "Орлов", age: 21, rating: 7),
    Students(name: "Борис", surname: "Лебедев", age: 22, rating: 6),
    Students(name: "Олег", surname: "Соколов", age: 23, rating: 5),
    Students(name: "Глеб", surname: "Михайлов", age: 24, rating: 4),
    Students(name: "Егор", surname: "Егоров", age: 25, rating: 9),
    Students(name: "Константин", surname: "Орлов", age: 26, rating: 6),
    Students(name: "Андерей", surname: "Лебедев", age: 27, rating: 7)
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
        
        // Сортировка по полному имени, если только по фамилии, то имена в случайном порядке
        students.sort(by: {$1.getFullName() > $0.getFullName()})
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }


}

