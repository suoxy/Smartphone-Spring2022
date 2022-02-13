//
//  ViewController.swift
//  twoVC(HW3_1)
//
//  Created by Xiyue Suo on 2/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtStreet: UITextField!
    @IBOutlet weak var txtApartment: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtState: UITextField!
    @IBOutlet weak var txtZip: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goToSecondVC(_ sender: Any) {
        performSegue(withIdentifier: "segueToSecondVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToSecondVC" {
            let secondVC = segue.destination as! SecondViewController
            secondVC.addressStr = "\(txtStreet.text!), \(txtApartment.text!), \(txtCity.text!), \(txtState.text!), \(txtZip.text!)"
        }
    }
    
}

