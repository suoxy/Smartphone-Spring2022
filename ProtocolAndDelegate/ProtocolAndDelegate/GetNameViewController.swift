//
//  GetNameViewController.swift
//  ProtocolAndDelegate
//
//  Created by Xiyue Suo on 2/13/22.
//

import UIKit
/*
 * this protocol can put anywhere outside the class
 *
protocol SendFirstAndLastNameDelegate {
    func setFirstAndLastName(firstName: String, lastName : String)
    func setWelcomeText(welcomeText : String)
}
 */

class GetNameViewController: UIViewController {

    var firstName : String?
    var lastName : String?
    
    var sendFirstAndLastNameDelegate : SendFirstAndLastNameDelegate?
    
    //var snedMessageDelegate : SendMessageDelegate?
    
    @IBOutlet weak var txtFirst: UITextField!
    @IBOutlet weak var txtLast: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        guard let firstName = firstName else {
            return
        }

        guard let lastName = lastName else {
            return
        }

        txtFirst.text = firstName
        txtLast.text = lastName
    }
    
    
    @IBAction func saveName(_ sender: Any) {
        guard let first = txtFirst.text else {
            return
        }
        guard let last = txtLast.text else {
            return
        }
        // iwant to call the func in the VC who called me
        sendFirstAndLastNameDelegate?.setFirstAndLastName(firstName: first, lastName: last)
        sendFirstAndLastNameDelegate?.setWelcomeText(welcomeText: "Welcome \(first), \(last)")
        
        self.navigationController?.popViewController(animated: true)
    }

}
