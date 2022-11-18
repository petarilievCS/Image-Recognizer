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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func cameraPressed(_ sender: UIBarButtonItem) {
        
    }
    
}

