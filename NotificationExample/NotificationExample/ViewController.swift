//
//  ViewController.swift
//  NotificationExample
//
//  Created by Xiyue Suo on 2/13/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblFirstName: UILabel!
    
    let nameNotif = Notification.Name(nameNotification)
    
    // remember to call deinit
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        subscribeToNotification()
    }

    @IBAction func goToProfile(_ sender: Any) {
        performSegue(withIdentifier: "segueProfile", sender: self)
    }
    
    @IBAction func goToFormEntry(_ sender: Any) {
        performSegue(withIdentifier: "segueFormEntry", sender: self)
    }
    
    func subscribeToNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(getName), name: nameNotif, object: nil)
    }
    
    @objc func getName(notif : NSNotification) {
        print("I am here")
        
        if let dict = notif.userInfo as NSDictionary? {
            if let firsName = dict["FirstName"] as? String {
                lblFirstName.text = firsName
            }
            if let lastName = dict["LastName"] as? String {
                lblLastName.text = lastName
            }
        }
    }
}

