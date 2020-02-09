//
//  InfoViewController.swift
//  HackCWRU Prototype
//
//  Created by Hieu Pham on 2/9/20.
//  Copyright © 2020 Hieu Pham. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    var dataController: SkinDefectCheckerController!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let textView = UITextView(frame: CGRect(x: 20.0, y: 90.0, width: 250.0, height: 100.0))
        self.automaticallyAdjustsScrollViewInsets = false
        
        textView.center = self.view.center
        textView.textAlignment = NSTextAlignment.justified
        textView.backgroundColor = UIColor.lightGray
        
        // Use RGB colour
        textView.backgroundColor = UIColor(red: 39/255, green: 53/255, blue: 182/255, alpha: 1)
        
        // Update UITextView font size and colour
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.textColor = UIColor.white
        
        textView.font = UIFont.boldSystemFont(ofSize: 20)
        textView.font = UIFont(name: "Verdana", size: 17)
        
        // Capitalize all characters user types
        textView.autocapitalizationType = UITextAutocapitalizationType.allCharacters
        
        // Make UITextView web links clickable
        textView.isSelectable = true
        textView.isEditable = false
        textView.dataDetectorTypes = UIDataDetectorTypes.link
        
        // Make UITextView corners rounded
        textView.layer.cornerRadius = 10
        
        // Enable auto-correction and Spellcheck
        textView.autocorrectionType = UITextAutocorrectionType.yes
        textView.spellCheckingType = UITextSpellCheckingType.yes
        // myTextView.autocapitalizationType = UITextAutocapitalizationType.None
        
        // Make UITextView Editable
        textView.isEditable = true
        
        self.view.addSubview(textView)
        
        switch dataController.choice {
        case "Bowen's Disease":
            <#code#>
        default:
            <#code#>
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
