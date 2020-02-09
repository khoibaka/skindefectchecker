//
//  GenderViewController.swift
//  HackCWRU Prototype
//
//  Created by Hieu Pham on 2/8/20.
//  Copyright © 2020 Hieu Pham. All rights reserved.
//

import UIKit

class GenderViewController: UIViewController {
    
    var dataController: SkinDefectCheckerController!
    //chosen gender is set to 3, which means nothing, by default
    var chosenGender = 3

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func maleButtonTouched(_ sender: Any) {
        chosenGender = 0
    }
    

    @IBAction func femaleButtonTouched(_ sender: Any) {
        chosenGender = 1
    }
    
    
    @IBAction func otherButtonTouched(_ sender: Any) {
        chosenGender = 2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let currentGenderData = dataController.checker.currentPatient
        let newGenderData = PatientData(age: currentGenderData.age, gender: chosenGender, skinLocation: currentGenderData.skinLocation, imageArray: currentGenderData.imageArray)
        if let locationViewController = segue.destination as? LocationViewController{
            dataController.checker.currentPatient = newGenderData
            locationViewController.dataController = dataController
        }
    }
}
