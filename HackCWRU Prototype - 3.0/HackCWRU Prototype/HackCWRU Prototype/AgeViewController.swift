//
//  AgeViewController.swift
//  HackCWRU Prototype
//
//  Created by Hieu Pham on 2/8/20.
//  Copyright © 2020 Hieu Pham. All rights reserved.
//

import UIKit

class AgeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var agePicker: UIPickerView!
    
    var agePickerData = [String]()
    // chosen age set by default to 1
    var chosenAge = 1
    // initialized at the 1st view controller so as not to get nil
    var dataController = SkinDefectCheckerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.agePicker.delegate = self
        self.agePicker.dataSource = self
        // create the data set
        let arr = Array(1...100)
        agePickerData = arr.map {String($0)}
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return agePickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return agePickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chosenAge = Int(agePickerData[row]) ?? 0
        //chosenAge = row + 1
    }
    
    // after clicking the confirm button
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let currentAgeData = dataController.checker.currentPatient
        let newAgeData = PatientData(age: chosenAge, gender: currentAgeData.gender, skinLocation: currentAgeData.skinLocation, imageArray: currentAgeData.imageArray)
        if let genderViewController = segue.destination as? GenderViewController{
            dataController.checker.currentPatient = newAgeData
            genderViewController.dataController = dataController
        }
    }
}
