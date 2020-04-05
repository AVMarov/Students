//
//  FilterViewController.swift
//  Students
//
//  Created by 1 on 05.04.2020.
//  Copyright © 2020 example. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {

    @IBOutlet weak var onlyNerdsSwitch: UISwitch!
    @IBOutlet weak var onlyMaleSwitch: UISwitch!
    @IBOutlet weak var onlyFemaleSwitch: UISwitch!
    
    @IBOutlet weak var applyButton: UIButton!
    
    var instance: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onlyNerdsSwitch.isOn = false
        onlyMaleSwitch.isOn = false
        onlyFemaleSwitch.isOn = false
    }
    
    @IBAction func onlyNerdsSwitchOn(_ sender: UISwitch) {
        //onlyNerdsSwitch.setOn(true, animated: true)
        onlyNerdsSwitch.isOn = true
    }
    
    @IBAction func onlyMaleSwitchOn(_ sender: UISwitch) {
        //onlyMaleSwitch.setOn(true, animated: true)
        onlyMaleSwitch.isOn = true
        onlyFemaleSwitch.setOn(false, animated: true)
    }
    
    @IBAction func onlyFemaleSwitchOn(_ sender: UISwitch) {
        //onlyFemaleSwitch.setOn(true, animated: true)
        onlyFemaleSwitch.isOn = true
        onlyMaleSwitch.setOn(false, animated: true)
    }
        
    @IBAction func applyFilters(_ sender: UIButton) {
        instance?.filterTheData(onlyNerds: onlyNerdsSwitch.isOn, onlyMale: onlyMaleSwitch.isOn, onlyFemale: onlyFemaleSwitch.isOn)
        self.dismiss(animated: true, completion: nil)
    }

}
