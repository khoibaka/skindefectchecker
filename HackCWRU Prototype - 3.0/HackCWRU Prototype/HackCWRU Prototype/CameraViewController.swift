//
//  ViewController.swift
//  HackCWRU Prototype
//
//  Created by Hieu Pham on 2/7/20.
//  Copyright © 2020 Hieu Pham. All rights reserved.
//

import UIKit
import MobileCoreServices

class CameraViewController: UIViewController, UIImagePickerControllerDelegate,
    UINavigationControllerDelegate
{
    var dataController: SkinDefectCheckerController!
    
    @IBOutlet weak var takenImage: UIImageView!
    
    @IBAction func takePicture(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            takenImage.contentMode = .scaleToFill
            takenImage.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let waitingViewController = segue.destination as? WaitingViewController {
            waitingViewController.dataController = dataController
        }
    }
}


