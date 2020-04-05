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
    var gender: String
    var profile: String?
    
    var age: Int {
        return Int.random(in: 18...30)
    }
    
    var rating: Double {
        return Double.random(in: 3...5)
    }
    
    var fullname: String {
        return "\(surname) \(name)"
    }
    
    init(name: String, surname: String, gender: String, profile: String? = nil){
        self.name = name
        self.surname = surname
        self.gender = gender
        self.profile = profile
    }
}
