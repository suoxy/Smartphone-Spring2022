//
//  SecondViewController.swift
//  twoVC(HW3_1)
//
//  Created by Xiyue Suo on 2/12/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var lblAddress: UILabel!
    
    var addressStr = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblAddress.text = addressStr
    }
    
    
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
