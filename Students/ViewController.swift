//
//  ViewController.swift
//  Students
//
//  Created by 1 on 02.04.2020.
//  Copyright © 2020 example. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //Студенты, все персонажи вымышлены любые совпадения случайны
    let students = [
    Student(name: "Иван", surname: "Иванов", age: 18, rating: 10),
    Student(name: "Петр", surname: "Смирнов", age: 19, rating: 9),
    Student(name: "Алексей", surname: "Сидоров", age: 20, rating: 8),
    Student(name: "Александр", surname: "Петров", age: 21, rating: 7),
    Student(name: "Владимир", surname: "Кузнецов", age: 22, rating: 6),
    Student(name: "Петр", surname: "Иванов", age: 23, rating: 5),
    Student(name: "Владимир", surname: "Смирнов", age: 24, rating: 4),
    Student(name: "Александр", surname: "Сидоров", age: 25, rating: 9),
    Student(name: "Алексей", surname: "Петров", age: 26, rating: 6),
    Student(name: "Иван", surname: "Кузнецов", age: 27, rating: 7),
    Student(name: "Константин", surname: "Соколов", age: 28, rating: 10),
    Student(name: "Андрей", surname: "Михайлов", age: 29, rating: 9),
    Student(name: "Дмитрий", surname: "Егоров", age: 30, rating: 8),
    Student(name: "Денис", surname: "Орлов", age: 21, rating: 7),
    Student(name: "Борис", surname: "Лебедев", age: 22, rating: 6),
    Student(name: "Олег", surname: "Соколов", age: 23, rating: 5),
    Student(name: "Глеб", surname: "Михайлов", age: 24, rating: 4),
    Student(name: "Егор", surname: "Егоров", age: 25, rating: 9),
    Student(name: "Константин", surname: "Орлов", age: 26, rating: 6),
    Student(name: "Андерей", surname: "Лебедев", age: 27, rating: 7)
    ].sorted(by: {$1.getFullName() > $0.getFullName()})
    // Сортировка по полному имени, если только по фамилии, то имена в случайном порядке
    
    var filteredData: [Student]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self        
        searchBar.delegate = self
        filteredData = students
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath)
        cell.textLabel?.text = filteredData[indexPath.row].getFullName()
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        
        filteredData = searchText.isEmpty ? students : students.filter { (item: Student) -> Bool in
            //return item.getFullName().range(of: searchText) != nil
            return item.getFullName().range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        
        tableView.reloadData()
    }
    
    


}

