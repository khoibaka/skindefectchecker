//
//  WaitingViewController.swift
//  HackCWRU Prototype
//
//  Created by Hieu Pham on 2/8/20.
//  Copyright © 2020 Hieu Pham. All rights reserved.
//

import UIKit

class WaitingViewController: UIViewController {
    
    var dataController: SkinDefectCheckerController!
    var timeCounter = 0
    

    
    @IBOutlet weak var proceedButton: UIButton!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        proceedButton.isHidden = true
        activityView.startAnimating()
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: { timer in
            self.proceedButton.isHidden = false
            self.activityView.stopAnimating()
        })
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        dataController.checker.process()
        if let tableViewController = segue.destination as? InfoTableViewController{
            tableViewController.dataController = dataController
        }
    }

}
