//
//  GetPlanViewController.swift
//  Assignment4
//
//  Created by Xiyue Suo on 2/21/22.
//

import UIKit

protocol SendThingAndMoodDelegate {
    func setThingAndMood(thing : String, mood : String)
}


class GetPlanViewController: UIViewController {
    
    var thing : String?
    var feeling : String?
    
    var sendThingAndMoodDelegate : SendThingAndMoodDelegate?
    
    @IBOutlet weak var txtThing: UITextField!
    @IBOutlet weak var txtFeeling: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let activity = thing else {
            return
        }
        
        guard let mood = feeling else {
            return
        }
        
        txtThing.text = activity
        txtFeeling.text = mood
         
        // Do any additional setup after loading the view.
    }
    

    @IBAction func savePlan(_ sender: Any) {
        guard let activity = txtThing.text else {return}
        guard let mood = txtFeeling.text else {return}
        
        sendThingAndMoodDelegate?.setThingAndMood(thing: activity, mood: mood)
        self.navigationController?.popViewController(animated: true)
    }
    
    

}
