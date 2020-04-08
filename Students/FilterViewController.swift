//
//  FilterViewController.swift
//  Students
//
//  Created by 1 on 05.04.2020.
//  Copyright © 2020 example. All rights reserved.
//

import UIKit

protocol ApplyFiltersDelegate {
    func applyFilters(settings: (onlyNerds: Bool, onlyMale: Bool, onlyFemale: Bool))
}

class FilterViewController: UIViewController {

    @IBOutlet weak var onlyNerdsSwitch: UISwitch!
    @IBOutlet weak var onlyMaleSwitch: UISwitch!
    @IBOutlet weak var onlyFemaleSwitch: UISwitch!
    
    @IBOutlet weak var applyButton: UIButton!
    
    
    enum Switch: String{
        case onlyNerds
        case onlyMale
        case onlyFemale
    }
    
    var filtersDelegate: ApplyFiltersDelegate!
    var defaultsEdit = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        checkSettings()
    }
    
    @IBAction func onlyNerdsSwitchOn(_ sender: UISwitch) { }
    
    @IBAction func onlyMaleSwitchOn(_ sender: UISwitch) {
        onlyFemaleSwitch.setOn(false, animated: true)
    }
    
    @IBAction func onlyFemaleSwitchOn(_ sender: UISwitch) {
        onlyMaleSwitch.setOn(false, animated: true)
    }
        
    @IBAction func tapButton(_ sender: UIButton) {
        filtersDelegate.applyFilters(settings: (onlyNerds: onlyNerdsSwitch.isOn,
                                                onlyMale: onlyMaleSwitch.isOn,
                                                onlyFemale: onlyFemaleSwitch.isOn))
        saveSettings()
        self.dismiss(animated: true, completion: nil)
    }
    
    func saveSettings(){
        defaultsEdit.set(onlyNerdsSwitch.isOn, forKey: Switch.onlyNerds.rawValue)
        defaultsEdit.set(onlyMaleSwitch.isOn, forKey: Switch.onlyMale.rawValue)
        defaultsEdit.set(onlyFemaleSwitch.isOn, forKey: Switch.onlyFemale.rawValue)
    }
    
    func checkSettings(){
        onlyNerdsSwitch.isOn = defaultsEdit.bool(forKey: Switch.onlyNerds.rawValue)
        onlyMaleSwitch.isOn = defaultsEdit.bool(forKey: Switch.onlyMale.rawValue)
        onlyFemaleSwitch.isOn = defaultsEdit.bool(forKey: Switch.onlyFemale.rawValue)
    }
}
