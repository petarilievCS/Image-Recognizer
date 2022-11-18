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
        
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = selectedImage
            guard let coreImage = CIImage(image: selectedImage) else {
                fatalError("Failed to convert image to CIImage")
            }
            detect(coreImage)
        }
        imagePicker.dismiss(animated: true)
    }
    
    // classify image
    func detect(_ image: CIImage) {
        
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
            fatalError("Failed to initialize ML model")
        }
        
        let request = VNCoreMLRequest(model: model) { request, error in
            guard let results = request.results else {
                fatalError("Error while accessing results")
            }
            print(results)
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            try handler.perform([request])
        } catch {
            print(error.localizedDescription)
        }
    }
}

