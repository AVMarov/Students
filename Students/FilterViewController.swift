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
    
    var filtersDelegate: ApplyFiltersDelegate!
    let defaults = UserDefaults.standard

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
        defaults.set([onlyNerdsSwitch.isOn,
                      onlyMaleSwitch.isOn,
                      onlyFemaleSwitch.isOn],
                     forKey: "settings")

    }
    
    func checkSettings(){
       let arrSettings = defaults.object(forKey: "settings") as? [Bool] ?? [false, false, false]
        onlyNerdsSwitch.isOn = arrSettings[0]
        onlyMaleSwitch.isOn = arrSettings[1]
        onlyFemaleSwitch.isOn = arrSettings[2]
    }

}
