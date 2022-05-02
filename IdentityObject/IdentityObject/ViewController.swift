//
//  ViewController.swift
//  IdentityObject
//
//  Created by Xiyue Suo on 4/17/22.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblImage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func identifyImageAction(_ sender: Any) {
        let alertController = UIAlertController(title: "Identify Image", message: "Select Image fromn Library or take a picture", preferredStyle: .alert)
                
                let cameraAction = UIAlertAction(title: "Camera", style: .default) { action in
                    if UIImagePickerController.isSourceTypeAvailable(.camera){
                        let imagePicker = UIImagePickerController()
                        imagePicker.delegate = self
                        imagePicker.sourceType = UIImagePickerController.SourceType.camera
                        imagePicker.allowsEditing = false
                        self.present(imagePicker, animated: true, completion: nil)
                    }
                }
                
                let libraryAction = UIAlertAction(title: "Photo Library", style: .default) { action in
                    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                        
                        let imagePicker = UIImagePickerController()
                        imagePicker.delegate = self
                        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
                        imagePicker.allowsEditing = false
                        self.present(imagePicker, animated: true, completion: nil)
                    }
                    
                }
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in
                    print("Cancel")
                }
                
                alertController.addAction(cameraAction)
                alertController.addAction(libraryAction)
                alertController.addAction(cancelAction)
                
                self.present(alertController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
                picker.dismiss(animated: true, completion: nil)
                return
            }
            
            imgView.image = image
            picker.dismiss(animated: true, completion: nil)
            identifyImage()
            
        }
    
    func identifyImage() {
        
        guard let ciImage = CIImage(image: imgView.image!) else {return}
        
        let config = MLModelConfiguration()
        //guard let model = try? VNCoreMLModel(for: Resnet50(configuration: config).model) else {return}
        //guard let model = try? VNCoreMLModel(for: SqueezeNet(configuration: config).model) else {return}
        guard let model = try? VNCoreMLModel(for: BugerPizzaOrSalad(configuration: config).model) else {return}
        let request = VNCoreMLRequest(model: model) { response, error in
            if error != nil {
                self.lblImage.text = error?.localizedDescription
                return
            }
            
            guard let result = response.results else {return}
            
            let topresult = result.first
            
            self.lblImage.text = (topresult! as AnyObject).identifier
            
            print(result)
        }
        
        let handler = VNImageRequestHandler(ciImage: ciImage)
        
        do{
            try handler.perform([request])
        }
        catch{
            print("Error in handler for Vision")
        }
        
        
    }
    
}

