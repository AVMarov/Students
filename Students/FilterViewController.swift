//
//  FilterViewController.swift
//  Students
//
//  Created by 1 on 05.04.2020.
//  Copyright © 2020 example. All rights reserved.
//

import UIKit

protocol ApplyFiltersDelegate {
    
//    var onlyNerds: Bool { get set }
//    var onlyMale: Bool { get set }
//    var onlyFemale: Bool { get set }

    func applyfilters(onlyNerds: Bool, onlyMale: Bool, onlyFemale: Bool)
}

class FilterViewController: UIViewController {

    @IBOutlet weak var onlyNerdsSwitch: UISwitch!
    @IBOutlet weak var onlyMaleSwitch: UISwitch!
    @IBOutlet weak var onlyFemaleSwitch: UISwitch!
    
    @IBOutlet weak var applyButton: UIButton!
    
    var filtersDelegate: ApplyFiltersDelegate!
//    var onlyNerds = false
//    var onlyMale = false
//    var onlyFemale = false
//
    override func viewDidLoad() {
        super.viewDidLoad()
                
//        onlyNerdsSwitch.isOn = filtersDelegate.onlyNerds
//        onlyMaleSwitch.isOn = filtersDelegate.onlyMale
//        onlyFemaleSwitch.isOn = filtersDelegate.onlyFemale
    }
    
    @IBAction func onlyNerdsSwitchOn(_ sender: UISwitch) {
        onlyNerdsSwitch.setOn(true, animated: true)
       // filtersDelegate.onlyNerds = true
    }
    
    @IBAction func onlyMaleSwitchOn(_ sender: UISwitch) {
        onlyMaleSwitch.setOn(true, animated: true)
       // filtersDelegate.onlyMale = true
        onlyFemaleSwitch.setOn(false, animated: true)
    }
    
    @IBAction func onlyFemaleSwitchOn(_ sender: UISwitch) {
        onlyFemaleSwitch.setOn(true, animated: true)
        //filtersDelegate.onlyFemale = true
        onlyMaleSwitch.setOn(false, animated: true)
    }
        
    @IBAction func tapButton(_ sender: UIButton) {
        filtersDelegate.applyfilters(onlyNerds: onlyNerdsSwitch.isOn, onlyMale: onlyMaleSwitch.isOn, onlyFemale: onlyFemaleSwitch.isOn)
        self.dismiss(animated: true, completion: nil)
    }

}
