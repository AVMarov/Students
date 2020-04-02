//
//  Student.swift
//  Students
//
//  Created by 1 on 02.04.2020.
//  Copyright © 2020 example. All rights reserved.
//
struct Student {
    var name: String
    var surname: String
    var age: Int
    var rating: Int
    
    func getFullName() -> String{
        return "\(surname) \(name)"
    }

    //Better to use computed property

    var fullname: String {
        return "\(surname) \(name)"
    }
}
