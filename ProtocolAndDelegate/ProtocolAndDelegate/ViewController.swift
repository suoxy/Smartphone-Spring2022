//
//  ViewController.swift
//  ProtocolAndDelegate
//
//  Created by Xiyue Suo on 2/13/22.
//

import UIKit

class ViewController: UIViewController, SendFirstAndLastNameDelegate {
    
    @IBOutlet weak var lblFirst: UILabel!
    @IBOutlet weak var lblLast: UILabel!
    
    @IBOutlet weak var lblWelcome: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getNameFromUser(_ sender: Any) {
        performSegue(withIdentifier: "segueGetName", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueGetName" {
            let getNameVC = segue.destination as! GetNameViewController
            guard let firstName = lblFirst.text else {
                return
            }
            guard let lastName = lblLast.text else {
                return
            }
            getNameVC.firstName = firstName
            getNameVC.lastName = lastName
            
            getNameVC.sendFirstAndLastNameDelegate = self
            //getNameVC.snedMessageDelegate = self // whatever you say i wil do
        }
    }
    
    func setFirstAndLastName(firstName: String, lastName: String) {
        lblFirst.text = firstName
        lblLast.text = lastName
    }
    
    func setWelcomeText(welcomeText : String) {
        lblWelcome.text = welcomeText
    }
    
    /*
    func sendMessage (message : String) {
        lblWelcome.text = message
    }
     */
    
}

