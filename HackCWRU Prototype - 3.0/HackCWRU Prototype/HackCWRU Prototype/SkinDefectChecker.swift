//
//  SkinDefectChecker.swift
//  HackCWRU Prototype
//
//  Created by Hieu Pham on 2/9/20.
//  Copyright © 2020 Hieu Pham. All rights reserved.
//

import Foundation

class SkinDefectChecker {

    // a patient with default meaningless value
    var currentPatient = PatientData(age: 1, gender: 3, skinLocation: 0, imageArray: Array(repeating: Array(repeating: Array(repeating: 0, count: 3), count: 224), count: 224))
    
    var skinData: [String: Int]
    
    init() {
        skinData = [
        "bkl": 10,
        "nv": 10,
        "df": 10,
        "mel": 10,
        "vasc": 10,
        "bcc": 10,
        "akiec": 40
        ]
    }
    
    func process() {
        // run AI function here
        tfFunction(age: currentPatient.age, gender: currentPatient.gender, location: currentPatient.skinLocation, imageArray: currentPatient.imageArray)
    }
    
    // supposedly AI function
    func tfFunction(age: Int, gender: Int, location: Int, imageArray: [[[Int]]]) {
        var start = 100
        for (key, value) in skinData {
            skinData[key] = Int(arc4random_uniform(UInt32(start)))
            start -= skinData[key]!
        }
    }
    
}

