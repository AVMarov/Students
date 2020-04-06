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
    var onlyNerds = Bool()
    var onlyMale = Bool()
    var onlyFemale = Bool()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        onlyNerdsSwitch.setOn(onlyNerds, animated: true)
//       onlyMaleSwitch.setOn(onlyMale, animated: true)
//        onlyFemaleSwitch.setOn(onlyFemale, animated: true)
//        onlyNerdsSwitch.isOn = onlyNerds
//        onlyMaleSwitch.isOn = onlyMale
//        onlyFemaleSwitch.isOn = onlyFemale
//    }
    
    @IBAction func onlyNerdsSwitchOn(_ sender: UISwitch) {
        self.onlyNerds = true
        //onlyNerdsSwitch.setOn(true, animated: true)
       // filtersDelegate.onlyNerds = true
    }
    
    @IBAction func onlyMaleSwitchOn(_ sender: UISwitch) {
        self.onlyMale = true
        //onlyMaleSwitch.setOn(true, animated: true)
       // filtersDelegate.onlyMale = true
        onlyFemaleSwitch.setOn(false, animated: true)
    }
    
    @IBAction func onlyFemaleSwitchOn(_ sender: UISwitch) {
        self.onlyFemale = true
        //onlyFemaleSwitch.setOn(true, animated: true)
        //filtersDelegate.onlyFemale = true
        onlyMaleSwitch.setOn(false, animated: true)
    }
        
    @IBAction func tapButton(_ sender: UIButton) {
        filtersDelegate.applyfilters(onlyNerds: self.onlyNerds, onlyMale: self.onlyMale, onlyFemale: self.onlyFemale)
        self.dismiss(animated: true, completion: nil)
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        onlyNerdsSwitch.isOn = onlyNerds
//        onlyMaleSwitch.isOn = onlyMale
//        onlyFemaleSwitch.isOn = onlyFemale
//
//
//       onlyNerdsSwitch.setOn(onlyNerds, animated: true)
//        onlyMaleSwitch.setOn(onlyMale, animated: true)
//     onlyFemaleSwitch.setOn(onlyFemale, animated: true)
//        //super.viewDidAppear(animated: true)
//    }

}
