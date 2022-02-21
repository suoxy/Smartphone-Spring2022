//
//  ViewController.swift
//  Assignment4
//
//  Created by Xiyue Suo on 2/21/22.
//

import UIKit

class ViewController: UIViewController, SendThingAndMoodDelegate {
    

    @IBOutlet weak var lblThing: UILabel!
    @IBOutlet weak var lblMood: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getPlanFromUser(_ sender: Any) {
        performSegue(withIdentifier: "segueGetPlan", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueGetPlan" {
            let getPlanVC = segue.destination as! GetPlanViewController
            guard let thing = lblThing.text else {return}
            guard let mood = lblMood.text else {return}
            
            getPlanVC.thing = thing
            getPlanVC.feeling = mood
            
            getPlanVC.sendThingAndMoodDelegate = self
        }
    }
    
    func setThingAndMood(thing: String, mood: String) {
        lblThing.text = thing
        lblMood.text = mood
    }
    
}

