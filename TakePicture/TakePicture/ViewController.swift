//
//  ViewController.swift
//  TakePicture
//
//  Created by Xiyue Suo on 3/13/22.
//

/*
 steps for localizatiopn:
 1. add a Localizable.strings file
 2. click on LOcalizable on the right meni fir the licalizatble file
 3. click on the Project on left side top ->clocko n projrct -> Info
 4. Add the language you want from the localizablr
 5. Your localizable file would add that language file
 6. creat ekey value pair for  all the strings you need to localize for e.g. ""rake_pic = "Taka a picture";
 7. "take_pic" = "拍照"
 8. remember to add a semi colon to the end of
 9. creaa Utilities folder and add ad swift file called LocalizabationUtil.swift
 10. create a variable for the key like following var strTakePic = NSLocalizedString("take_pic", cooment:"")
 11.  in the viewDidLoad ort a seperate function get the localized string and set the title as sollowing
 12. change the language from Settings
 */

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var btnTakePic: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btnTakePic.setTitle(strTakePic, for: .normal)
    }

    @IBAction func takePictureAction(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Take a picture", message: "select image from library or take a picture", preferredStyle: .alert)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { action in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.camera
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        
        let libraryAction = UIAlertAction(title: "Photo Library", style: .default) { action in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { action in
            print("cancel")
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
    }
    
}

