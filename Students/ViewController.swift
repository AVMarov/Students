//
//  ViewController.swift
//  Students
//
//  Created by 1 on 02.04.2020.
//  Copyright © 2020 example. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!     
    @IBOutlet weak var filtersButton: UIButton!
    
    
    //Студенты, все персонажи вымышлены любые совпадения случайны
    let students = [
        Student(name: "Иван", surname: "Иванов", gender: true, profile: "https://www.google.com"),
        Student(name: "Петр", surname: "Смирнов", gender: true),
        Student(name: "Алексей", surname: "Сидоров", gender: true),
        Student(name: "Александр", surname: "Петров", gender: true),
        Student(name: "Владимир", surname: "Кузнецов", gender: true),
        Student(name: "Петр", surname: "Иванов", gender: true),
        Student(name: "Владимир", surname: "Смирнов", gender: true),
        Student(name: "Александр", surname: "Сидоров", gender: true),
        Student(name: "Алексей", surname: "Петров", gender: true),
        Student(name: "Иван", surname: "Кузнецов", gender: true),
        Student(name: "Константин", surname: "Соколов", gender: true),
        Student(name: "Андрей", surname: "Михайлов", gender: true),
        Student(name: "Дмитрий", surname: "Егоров", gender: true),
        Student(name: "Денис", surname: "Орлов", gender: true),
        Student(name: "Борис", surname: "Лебедев", gender: true),
        Student(name: "Олег", surname: "Соколов", gender: true),
        Student(name: "Глеб", surname: "Михайлов", gender: true),
        Student(name: "Егор", surname: "Егоров", gender: true),
        Student(name: "Константин", surname: "Орлов", gender: true),
        Student(name: "Андерей", surname: "Лебедев", gender: true),
        Student(name: "Мария", surname: "Иванова", gender: false),
        Student(name: "Ирина", surname: "Смирнова", gender: false),
        Student(name: "Светлана", surname: "Сидорова", gender: false),
        Student(name: "Екатерина", surname: "Петрова", gender: false),
        Student(name: "Елизавета", surname: "Кузнецова", gender: false),
        Student(name: "Анастасия", surname: "Иванова", gender: false),
        Student(name: "Кристина", surname: "Смирнова", gender: false),
        Student(name: "Ольга", surname: "Сидорова", gender: false),
        Student(name: "Юлия", surname: "Петрова", gender: false),
        Student(name: "Елена", surname: "Кузнецова", gender: false),
        Student(name: "Анна", surname: "Соколова", gender: false),
        Student(name: "Алина", surname: "Михайлова", gender: false),
        Student(name: "Ольга", surname: "Егорова", gender: false),
        Student(name: "Светлана", surname: "Орлова", gender: false),
        Student(name: "Юлия", surname: "Лебедева", gender: false),
        Student(name: "Екатерина", surname: "Соколова", gender: false),
        Student(name: "Елизавета", surname: "Михайлова", gender: false),
        Student(name: "Мария", surname: "Егорова", gender: false),
        Student(name: "Кристина", surname: "Орлова", gender: false),
        Student(name: "Анастасия", surname: "Лебедева", gender: false, profile: "https://www.apple.com")
        ].sorted(by: { $1.fullname > $0.fullname })
    // Сортировка по полному имени, если только по фамилии, то имена в случайном порядке
    
    var filteredData = [Student]()
    
    //var webView = WKWebView()
    // var filterViewController: FilterViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "StudentCell")
        tableView.keyboardDismissMode = .onDrag
        
        searchBar.delegate = self
        searchBar.sizeToFit()
        
        filteredData = students
        
        filtersButton.addTarget(self, action: #selector(openFilterViewController), for: .touchUpInside)
        
        //webView = WKWebView()
        // self.filterTheData( false, false, false)
        // webView.navigationDelegate = self
    }
    
    //    override func loadView() {
    //        //webView = WKWebView()
    //        //webView.navigationDelegate = self
    //        self.view = webView
    //    }
    
    //    func webView(_ webView: WKWebView, didP: WKNavigation!) {
    //        title = webView.title
    //    }
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let actionList  = UIAlertController(title: nil, message: "Выберите действие", preferredStyle: .actionSheet)
        let showProfile = UIAlertAction(title: "Профиль в соц сетях", style: .default)
        { (action) in
            
            let alertController = UIAlertController(title: nil, message: "Нет данных о профиле в социальных сетях " , preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
            alertController.addAction(ok)
            self.present(alertController, animated: true, completion: nil)
            
        }
        let showData = UIAlertAction(title: "Посмотреть данные", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        actionList.addAction(showProfile)
        actionList.addAction(showData)
        actionList.addAction(cancel)
        present(actionList, animated: true, completion: nil)
    }
    
    //    func showAlert(){
    //        let alertController = UIAlertController(title: nil, message: "Нет данных о профиле в социальных сетях " , preferredStyle: .alert)
    //        present(alertController, animated: true, completion: nil)
    //    }
    
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
    
    @objc func openFilterViewController(){
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let filterViewController = storyboard.instantiateViewController(withIdentifier: "FilterViewController") as? FilterViewController
        filterViewController?.instance = self
        self.present(filterViewController!, animated: true, completion: nil)
    }
    
    func filterTheData(_ onlyNerds: Bool, _ onlyMale: Bool, _ onlyFemale: Bool) {
        switch true{
            
        case onlyNerds && !onlyMale && !onlyFemale: filteredData = students.filter { $0.rating >= 4.5 }
        case onlyMale: filteredData = students.filter { $0.gender == true}
        case onlyFemale: filteredData = students.filter { $0.gender == false }
        case onlyNerds && onlyMale: filteredData = students.filter { $0.rating >= 4.5 && $0.gender == true }
        case onlyNerds && onlyFemale: filteredData = students.filter {$0.rating >= 4.5 && $0.gender == false}
            
        default: filteredData = students
        }
        tableView.reloadData()
    }
    
    //try pass data through delegates
}

//extension WKWebView {
//    func load(_ urlString: String){
//        if let url = URL(string: urlString){
//            let request = URLRequest(url: url)
//            load(request)
//        }
//    }
//}
