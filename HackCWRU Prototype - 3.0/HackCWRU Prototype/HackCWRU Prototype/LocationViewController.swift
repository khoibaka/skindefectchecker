//
//  LocationViewController.swift
//  HackCWRU Prototype
//
//  Created by Hieu Pham on 2/8/20.
//  Copyright © 2020 Hieu Pham. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var dataController: SkinDefectCheckerController!

    var locationPickerData = [String]()
    // chosen location set to back by default
    var chosenLocation = 0

    @IBOutlet weak var locationPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.locationPicker.delegate = self
        self.locationPicker.dataSource = self
        locationPickerData = ["Back", "Lower Extremity", "Trunk", "Upper Extremity", "Abdomen", "Face", "Chest" ,"Foot", "Unknown", "Neck", "Scalp", "Hand", "Ear", "Genital", "Finger/Toe"]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return locationPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return locationPickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chosenLocation = row
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let currentLocationData = dataController.checker.currentPatient
        let newLocationData = PatientData(age: currentLocationData.age, gender: currentLocationData.gender, skinLocation: chosenLocation, imageArray: currentLocationData.imageArray)
        if let cameraViewController = segue.destination as? CameraViewController{
            dataController.checker.currentPatient = newLocationData
            cameraViewController.dataController = dataController
        }
    }

}
