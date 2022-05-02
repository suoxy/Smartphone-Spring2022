//
//  ViewController.swift
//  HappyOrSadText
//
//  Created by Xiyue Suo on 4/17/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtHappySad: UITextField!
    
    @IBOutlet weak var lblHappySad: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func analyzeTextAction(_ sender: Any) {
        guard let text = txtHappySad.text else {return}
        
        let model =HappyOrSad()
        let prediction = try! model.prediction(text: String)
        lblHappySad.text = prediction
    }
    
}

