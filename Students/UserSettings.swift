//
//  UserSettings.swift
//  Students
//
//  Created by 1 on 08.04.2020.
//  Copyright © 2020 example. All rights reserved.
//

import Foundation

final class UserSettings {
     
    private enum Keys: String {
        case settings
        case studentsArray
    }
    
    static var filterSettings: [Bool]! {
        get{
            return UserDefaults.standard.object(forKey: Keys.settings.rawValue) as? [Bool] ?? [false, false, false]
        }
        set{
            let defaults = UserDefaults.standard
            let key = Keys.settings.rawValue
            if let settings = newValue {
                defaults.set([settings[0], settings[1], settings[2]], forKey: key)
            } else {
                defaults.removeObject(forKey: key)                
            }
        }
    }
    
//    static var studentsArray: [Student]! {
//        get{
//            
//        }
//        set{
//            let defaults = UserDefaults.standard
//            let key = Keys.studentsArray.rawValue
//            let jsonEncoder = JSONEncoder()
//            
//           // if let savedData = try? jsonEncoder.encode(student){
//            
//            if let list = newValue{
//                list.map { $0 = try? jsonEncoder.encode($0) }
//            
//            }
//        }
//    }
}
    

