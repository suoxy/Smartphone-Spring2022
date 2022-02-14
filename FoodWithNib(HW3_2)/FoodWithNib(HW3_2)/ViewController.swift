//
//  ViewController.swift
//  FoodWithNib(HW3_2)
//
//  Created by Xiyue Suo on 2/14/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let images = ["lobster01", "hamburger02", "lamb03", "boilingPoint04", "breakfast05", "wantuoer06", "fruit07", "jelly08", "noodle09", "pork10"]
    let foodNames = ["Lobster Roll", "Hamburger", "Lamb Stew", "Boiling Point", "Breakfast", "Wan Tuo Er", "Fruit", "Jelly", "Noodle Pot", "Pork Stew"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
        cell.imgView.image = UIImage(named: images[indexPath.row])
        cell.lblImage.text = foodNames[indexPath.row]
        
        return cell
    }


}

