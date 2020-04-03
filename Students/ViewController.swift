//
//  ViewController.swift
//  Students
//
//  Created by 1 on 02.04.2020.
//  Copyright © 2020 example. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UISearchResultsUpdating {
       
    
    @IBOutlet weak var tableView: UITableView!
    
    var searchController: UISearchController!
    
    //Студенты, все персонажи вымышлены любые совпадения случайны
    let students = [
        Student(name: "Иван", surname: "Иванов", gender: "Муж", profile: "www.google.com"),
        Student(name: "Петр", surname: "Смирнов", gender: "Муж"),
        Student(name: "Алексей", surname: "Сидоров", gender: "Муж"),
        Student(name: "Александр", surname: "Петров", gender: "Муж"),
        Student(name: "Владимир", surname: "Кузнецов", gender: "Муж"),
        Student(name: "Петр", surname: "Иванов", gender: "Муж"),
        Student(name: "Владимир", surname: "Смирнов", gender: "Муж"),
        Student(name: "Александр", surname: "Сидоров", gender: "Муж"),
        Student(name: "Алексей", surname: "Петров", gender: "Муж"),
        Student(name: "Иван", surname: "Кузнецов", gender: "Муж"),
        Student(name: "Константин", surname: "Соколов", gender: "Муж"),
        Student(name: "Андрей", surname: "Михайлов", gender: "Муж"),
        Student(name: "Дмитрий", surname: "Егоров", gender: "Муж"),
        Student(name: "Денис", surname: "Орлов", gender: "Муж"),
        Student(name: "Борис", surname: "Лебедев", gender: "Муж"),
        Student(name: "Олег", surname: "Соколов", gender: "Муж"),
        Student(name: "Глеб", surname: "Михайлов", gender: "Муж"),
        Student(name: "Егор", surname: "Егоров", gender: "Муж"),
        Student(name: "Константин", surname: "Орлов", gender: "Муж"),
        Student(name: "Андерей", surname: "Лебедев", gender: "Муж"),
        Student(name: "Мария", surname: "Иванова", gender: "Жен"),
        Student(name: "Ирина", surname: "Смирнова", gender: "Жен"),
        Student(name: "Светлана", surname: "Сидорова", gender: "Жен"),
        Student(name: "Екатерина", surname: "Петрова", gender: "Жен"),
        Student(name: "Елизавета", surname: "Кузнецова", gender: "Жен"),
        Student(name: "Анастасия", surname: "Иванова", gender: "Жен"),
        Student(name: "Кристина", surname: "Смирнова", gender: "Жен"),
        Student(name: "Ольга", surname: "Сидорова", gender: "Жен"),
        Student(name: "Юлия", surname: "Петрова", gender: "Жен"),
        Student(name: "Елена", surname: "Кузнецова", gender: "Жен"),
        Student(name: "Анна", surname: "Соколова", gender: "Жен"),
        Student(name: "Алина", surname: "Михайлова", gender: "Жен"),
        Student(name: "Ольга", surname: "Егорова", gender: "Жен"),
        Student(name: "Светлана", surname: "Орлова", gender: "Жен"),
        Student(name: "Юлия", surname: "Лебедева", gender: "Жен"),
        Student(name: "Екатерина", surname: "Соколова", gender: "Жен"),
        Student(name: "Елизавета", surname: "Михайлова", gender: "Жен"),
        Student(name: "Мария", surname: "Егорова", gender: "Жен"),
        Student(name: "Кристина", surname: "Орлова", gender: "Жен"),
        Student(name: "Анастасия", surname: "Лебедева", gender: "Жен", profile: "www.apple.com")
        ].sorted(by: { $1.fullname > $0.fullname })
    // Сортировка по полному имени, если только по фамилии, то имена в случайном порядке
    
    var filteredData = [Student]() //Don't need to force unwrap here
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "StudentCell") // Need to register every reuse indetifier of cell in tableview
                
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.sizeToFit()
        
        tableView.tableHeaderView = searchController.searchBar
    
        definesPresentationContext = true
        filteredData = students
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Фильтры",
//                                                            style: .plain,
//                                                            target: self,
//                                                            action: #selector(pushRightBarButtonItem))
    }

    
    //Number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return filteredData.count
    }
    
    //Add cells to tableView and set textLabel to cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath)
        cell.textLabel?.text = filteredData[indexPath.row].fullname
        return cell
    }
    
    //Search implementation
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filteredData = searchText.isEmpty ? students : students.filter {
                $0.fullname.range(of: searchText,
                                  options: .caseInsensitive,
                                  range: nil,
                                  locale: nil) != nil
            }
            tableView.reloadData()
        }
    }
  
    
//Try to present viewControllersFilters onto ViewController
//    @objc func pushRightBarButtonItem(){
//        let viewControllerFilters = ViewControllerFilters(nibName: "ViewControllerFilters", bundle: nil)
//
//        self.present(viewControllerFilters,
//                     animated: true,
//                     completion: nil)
//    }
}

    

   
