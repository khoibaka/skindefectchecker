//
//  InfoTableViewCell.swift
//  HackCWRU Prototype
//
//  Created by Hieu Pham on 2/9/20.
//  Copyright © 2020 Hieu Pham. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    var dataController: SkinDefectCheckerController!
    
    @IBOutlet weak var readButton: UIButton!
    @IBOutlet weak var defectLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func choiceGiven(_ sender: Any) {
        dataController.choice = defectLabel.text!
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let infoViewController = segue.destination as? InfoViewController {
            infoViewController.dataController = dataController
        }
    }
}
