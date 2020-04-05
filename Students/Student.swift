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
    var gender: Bool
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
    
    var fullnameAndRating: String {
        return "\(fullname) " + String(format: "%.02f", rating)
    }
    
    init(name: String, surname: String, gender: Bool, profile: String? = nil){
        self.name = name
        self.surname = surname
        self.gender = gender
        self.profile = profile
    }
}

