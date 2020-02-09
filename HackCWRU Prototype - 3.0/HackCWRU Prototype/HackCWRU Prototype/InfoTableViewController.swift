//
//  InfoTableViewController.swift
//  HackCWRU Prototype
//
//  Created by Hieu Pham on 2/9/20.
//  Copyright © 2020 Hieu Pham. All rights reserved.
//

import UIKit

class InfoTableViewController: UITableViewController {
    
    var dataController: SkinDefectCheckerController!
    
    @IBOutlet var defectTableView: UITableView!
    
    var defectTypes = [Defect]()
    
    private func loadDefectData() {
        for (key, value) in dataController.checker.skinData {
            switch key {
            case "akiec":
                let defect = Defect(name: "Bowen's Disease", percentage: value, information: "bla bla")
                defectTypes += [defect]
            case "bcc":
                let defect = Defect(name: "Basal cell carcinoma", percentage: value, information: "bla bla")
                defectTypes += [defect]
            case "bkl":
                let defect = Defect(name: "Benign keratosis-like lesions", percentage: value, information: "bla bla")
                defectTypes += [defect]
            case "df":
                let defect = Defect(name: "Dermatofibroma", percentage: value, information: "bla bla")
                defectTypes += [defect]
            case "mel":
                let defect = Defect(name: "Melanoma", percentage: value, information: "bla bla")
                defectTypes += [defect]
            case "nv":
                let defect = Defect(name: "Melanotic nevi", percentage: value, information: "bla bla")
                defectTypes += [defect]
            case "vasc":
                let defect = Defect(name: "Vascular lesions", percentage: value, information: "bla bla")
                defectTypes += [defect]
            default:
                print("Key not found")
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadDefectData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return defectTypes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "InfoTableViewCell"
        //tableView.register(InfoTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? InfoTableViewCell else{
            fatalError("bad type for cell table")
        }

        let defectType = defectTypes[indexPath.row]
        cell.defectLabel.text = "\(defectType.name): \(defectType.percentage)%"
        //cell.defectText.text = defectType.information
        return cell
    }



}
