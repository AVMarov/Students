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
    var onlyNerds = false
    var onlyMale = false
    var onlyFemale = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        onlyNerdsSwitch.isOn = onlyNerds
        onlyMaleSwitch.isOn = onlyMale
        onlyFemaleSwitch.isOn = onlyFemale
    }
    
    @IBAction func onlyNerdsSwitchOn(_ sender: UISwitch) {
        //onlyNerdsSwitch.setOn(true, animated: true)
       onlyNerds = true
    }
    
    @IBAction func onlyMaleSwitchOn(_ sender: UISwitch) {
        //onlyMaleSwitch.setOn(true, animated: true)
        onlyMale = true
        onlyFemaleSwitch.setOn(false, animated: true)
    }
    
    @IBAction func onlyFemaleSwitchOn(_ sender: UISwitch) {
        //onlyFemaleSwitch.setOn(true, animated: true)
        onlyFemale = true
        onlyMaleSwitch.setOn(false, animated: true)
    }
        
    @IBAction func applyFilters(_ sender: UIButton) {
        instance?.filterTheData(onlyNerds,onlyMale,onlyFemale)
        //instance?.filterViewController = self
        self.dismiss(animated: true, completion: nil)
    }

}
