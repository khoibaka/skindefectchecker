//
//  Defect.swift
//  HackCWRU Prototype
//
//  Created by Hieu Pham on 2/9/20.
//  Copyright © 2020 Hieu Pham. All rights reserved.
//

import Foundation

struct Defect {
    var name: String
    var percentage: Int
    var information: String
    
    init(name: String, percentage: Int, information: String) {
        self.name = name
        self.percentage = percentage
        self.information = information
    }
}
