//
//  ViewController.swift
//  Students
//
//  Created by 1 on 02.04.2020.
//  Copyright © 2020 example. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, WKNavigationDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!     
    @IBOutlet weak var filtersButton: UIButton!
    
    
    var students = [
        Student(name: "Иван", surname: "Иванов", gender: true, rating: 3.0, profile: "https://www.google.com"),
        Student(name: "Петр", surname: "Смирнов", gender: true, rating: 3.1),
        Student(name: "Алексей", surname: "Сидоров",gender: true, rating: 3.2),
        Student(name: "Александр", surname: "Петров",gender: true, rating: 3.3),
        Student(name: "Владимир", surname: "Кузнецов",gender: true, rating: 3.4),
        Student(name: "Петр", surname: "Иванов",gender: true, rating: 3.5),
        Student(name: "Владимир", surname: "Смирнов",gender: true, rating: 3.6),
        Student(name: "Александр", surname: "Сидоров",gender: true, rating: 3.7),
        Student(name: "Алексей", surname: "Петров",gender: true, rating: 3.8),
        Student(name: "Иван", surname: "Кузнецов",gender: true, rating: 3.9),
        Student(name: "Константин", surname: "Соколов",gender: true, rating: 4.0),
        Student(name: "Андрей", surname: "Михайлов",gender: true, rating: 4.1),
        Student(name: "Дмитрий", surname: "Егоров",gender: true, rating: 4.2),
        Student(name: "Денис", surname: "Орлов",gender: true, rating: 4.3),
        Student(name: "Борис", surname: "Лебедев",gender: true, rating: 4.4),
        Student(name: "Олег", surname: "Соколов",gender: true, rating: 4.5),
        Student(name: "Глеб", surname: "Михайлов",gender: true, rating: 4.6),
        Student(name: "Егор", surname: "Егоров",gender: true, rating: 4.7),
        Student(name: "Константин", surname: "Орлов",gender: true, rating: 4.8),
        Student(name: "Андерей", surname: "Лебедев",gender: true, rating: 4.9),
        Student(name: "Мария", surname: "Иванова",gender: false, rating: 5.0),
        Student(name: "Ирина", surname: "Смирнова",gender: false, rating: 3.0),
        Student(name: "Светлана", surname: "Сидорова",gender: false, rating: 3.1),
        Student(name: "Екатерина", surname: "Петрова",gender: false, rating: 3.2),
        Student(name: "Елизавета", surname: "Кузнецова",gender: false, rating: 3.3),
        Student(name: "Анастасия", surname: "Иванова",gender: false, rating: 3.4),
        Student(name: "Кристина", surname: "Смирнова",gender: false, rating: 3.5),
        Student(name: "Ольга", surname: "Сидорова",gender: false, rating: 3.6),
        Student(name: "Юлия", surname: "Петрова",gender: false, rating: 3.7),
        Student(name: "Елена", surname: "Кузнецова",gender: false, rating: 3.8),
        Student(name: "Анна", surname: "Соколова",gender: false, rating: 3.9),
        Student(name: "Алина", surname: "Михайлова",gender: false, rating: 4.0),
        Student(name: "Ольга", surname: "Егорова",gender: false, rating: 4.1),
        Student(name: "Светлана", surname: "Орлова",gender: false, rating: 4.2),
        Student(name: "Юлия", surname: "Лебедева",gender: false, rating: 4.3),
        Student(name: "Екатерина", surname: "Соколова",gender: false, rating: 4.4),
        Student(name: "Елизавета", surname: "Михайлова",gender: false, rating: 4.5),
        Student(name: "Мария", surname: "Егорова",gender: false, rating: 4.6),
        Student(name: "Кристина", surname: "Орлова",gender: false, rating: 4.7),
        Student(name: "Анастасия", surname: "Лебедева",gender: false, rating: 4.8, profile: "https://www.apple.com")
        ].sorted(by: { $1.fullname > $0.fullname })
    
    
    var filteredData = [Student]()
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "StudentCell")
        tableView.keyboardDismissMode = .onDrag
        
        searchBar.delegate = self
        searchBar.sizeToFit()
                
        filtersButton.addTarget(self, action: #selector(openFilterViewController), for: .touchUpInside)
                
        if let savedStudent = defaults.object(forKey: "ListOfStudents") as? Data {
            let jsonDecoder = JSONDecoder()
            do{
                students = try jsonDecoder.decode([Student].self, from: savedStudent)
            } catch {
                print("Failed to load students from encode list")
            }
        }
    }
    
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let settings = defaults.object(forKey: "filterSettings") as? [Bool] ?? [false, false, false]
        filterTheData(settings: settings)        
    }
    
    //TableView functions
    //Number of row in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return filteredData.count
    }
    
    //Load data in table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath)
        cell.textLabel?.text = filteredData[indexPath.row].fullnameAndRating
        return cell
    }
    
    //Clicked on cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showActionList(index: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    //UIAlert functons
    //Show actioSheet with list of actions
    func showActionList(index: IndexPath){
        let name = tableView.cellForRow(at: index)?.textLabel?.text ?? ""
        let actionList  = UIAlertController(title: name, message: nil, preferredStyle: .actionSheet)
        
        actionList.addAction(UIAlertAction(title: "Профиль в соц сетях", style: .default) { (action) in
            if let web = self.filteredData[index.row].profile{
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let webViewController = storyboard.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController
                webViewController?.website = web
                self.navigationController?.pushViewController(webViewController!, animated: true)
                
            }else{ self.showAlert() }
        })
        
        actionList.addAction(UIAlertAction(title: "Посмотреть данные", style: .default) { (action) in
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let editDataTableViewController = storyboard.instantiateViewController(withIdentifier: "EditDataTableViewController") as? EditDataTableViewController
            editDataTableViewController?.editStudentDelegate = self
            editDataTableViewController?.student = self.filteredData[index.row]
            editDataTableViewController?.index = index.row
            self.navigationController?.pushViewController(editDataTableViewController!, animated: true)
        })
        
        actionList.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        present(actionList, animated: true, completion: nil)
    }
    
    func showAlert(){
        let alertController = UIAlertController(title: nil, message: "Нет данных о профиле в социальных сетях " , preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ок", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    //SearchBar functions
    //Search
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = searchText.isEmpty ? students : students.filter {
            $0.fullname.range(of: searchText,
                              options: .caseInsensitive,
                              range: nil,
                              locale: nil) != nil
        }
        tableView.reloadData()
    }
    
    //Show cancel button when seachBar is active
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }
    
    //Hide keyboard when clicked search button
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        tableView.reloadData()
        searchBar.endEditing(true)
    }
    
    //Hide keyboard and clear text in searchBar and show full list of data when clicked cancel button
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.endEditing(true)
        filteredData = students
        tableView.reloadData()
    }
    
    //Dismiss cancel button when searchBar is no active
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
    
       
    //Open viewcontroller with filters
    @objc func openFilterViewController(){
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let filterViewController = storyboard.instantiateViewController(withIdentifier: "FilterViewController") as? FilterViewController
        filterViewController?.filtersDelegate = self
        self.present(filterViewController!, animated: true, completion: nil)
    }
    
    
    //Filter the data
    func filterTheData(settings: [Bool]) {
        switch settings {
        case [true, false, false]: filteredData = students.filter { $0.rating >= 4.5 }
        case [false, true, false]: filteredData = students.filter { $0.gender == true }
        case [false, false, true]: filteredData = students.filter { $0.gender == false }
        case [true, true, false]: filteredData = students.filter { $0.rating >= 4.5 && $0.gender == true }
        case [ true, false, true]: filteredData = students.filter {$0.rating >= 4.5 && $0.gender == false}
        default: filteredData = students
        }
        tableView.reloadData()
    }
    
    func saveStudent(){
        let jsonEncoder = JSONEncoder()
        if let savedData = try? jsonEncoder.encode(students){
            defaults.set(savedData, forKey: "ListOfStudents")
        } else {
            print("Failed to save students")
        }
    }
}


//Extension for apply filters
extension ViewController: ApplyFiltersDelegate{
    func applyFilters(settings: (onlyNerds: Bool, onlyMale: Bool, onlyFemale: Bool)) {
        filterTheData(settings: [settings.onlyNerds, settings.onlyMale, settings.onlyFemale])
        defaults.set([settings.onlyNerds, settings.onlyMale, settings.onlyFemale], forKey: "filterSettings")
    }
}


extension ViewController: EditStudentDelegate{
    func saveNewProperties(index:Int, name: String, rating: String, gender: String, prolile: String?) {
        students[index].changeProperties(name, rating, gender, prolile)
        self.saveStudent()
    }
   
}
