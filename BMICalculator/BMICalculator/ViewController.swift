//
//  ViewController.swift
//  BMICalculator
//
//  Created by Xiyue Suo on 5/2/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtWeight: UITextField!
    @IBOutlet weak var txtFeet: UITextField!
    @IBOutlet weak var txtInch: UITextField!
    
    @IBOutlet weak var switchMetric: UISwitch!
    
    @IBOutlet weak var lblBMI: UILabel!
    
    //var lbs: Double = 0.0
    //var feet: Double = 0.0
    //var inch: Double = 0.0
    //var bmi: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func switchMetric(_ sender: UISwitch) {
        self.txtWeight.text = ""
        self.txtFeet.text = ""
        self.txtInch.text = ""
        
        if (self.switchMetric.isOn){
            self.txtWeight.placeholder = "weight in kg"
            self.txtFeet.placeholder = "height in cm"
            self.txtInch.placeholder = "N/A"
            self.txtInch.isEnabled = false
        } else {
            self.txtWeight.placeholder = "weight in lbs"
            self.txtFeet.placeholder = "feet"
            self.txtInch.placeholder = "inch"
            self.txtInch.isEnabled = true
        }
    }
    
    
    @IBAction func calculateBMIAction(_ sender: Any) {
        //let weight = txtWeight.text
        //print(weight)
        var bmi : Double
        if (self.switchMetric.isOn) {
            guard let kg = Double(txtWeight.text!) else {
                lblBMI.text = "enter weight"
                return
            }
            guard let cm = Double(txtFeet.text!) else {
                lblBMI.text = "enter height"
                return
            }
            let meter = cm/100
            bmi = round(kg / (meter * meter) * 100) / 100.0
        } else { // switch off , use lbs feet inch
            guard let lbs = Double(txtWeight.text!) else {
                lblBMI.text = "enter weight"
                return
            }
            guard let ft = Double(txtFeet.text!) else {
                lblBMI.text = "enter feet"
                return
            }
            guard let inch = Double(txtInch.text!) else {
                lblBMI.text = "enter inch"
                return
            }
            let inches = ft * 12 + inch
            bmi = round(lbs * 703 / (inches * inches) * 100) / 100.0
        }
                
        print(bmi)
        if bmi < 18.5 {
            lblBMI.text = "BMI: \(bmi) Underweight"
        } else if bmi < 24.9 {
            lblBMI.text = "BMI: \(bmi) Healthy"
        } else if bmi < 29.9 {
            lblBMI.text = "BMI: \(bmi) Overweight"
        } else {
            lblBMI.text = "BMI: \(bmi) Obese"
        }
        
    }
    
    

}

