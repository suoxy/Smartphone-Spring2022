//
//  SecondViewController.swift
//  SegueExample
//
//  Created by Xiyue Suo on 2/11/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var lblWelcome: UILabel!
    var welcomeStr = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblWelcome.text = welcomeStr

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBack(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }

}
