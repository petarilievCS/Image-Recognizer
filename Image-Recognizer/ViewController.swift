//
//  ViewController.swift
//  Image-Recognizer
//
//  Created by Petar Iliev on 18.11.22.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
    }

    @IBAction func cameraPressed(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true)
    }
    
    // image taken
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage]
        imageView.image = selectedImage as? UIImage
        imagePicker.dismiss(animated: true) 
        
    }
}

