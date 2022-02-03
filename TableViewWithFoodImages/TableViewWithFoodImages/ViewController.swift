//
//  ViewController.swift
//  TableViewWithFoodImages
//
//  Created by Xiyue Suo on 1/30/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tblView: UITableView!
    
    let images = ["lobster01", "hamburger02", "lamb03", "boilingPoint04", "breakfast05", "wantuoer06", "fruit07", "jelly08", "noodle09", "pork10"]
    let foodNames = ["Lobster Roll", "Hamburger", "Lamb Stew", "Boiling Point", "Breakfast", "Wan Tuo Er", "Fruit", "Jelly", "Noodle Pot", "Pork Stew"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblView.delegate = self
        tblView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.imgViewCell.image = UIImage(named: images[indexPath.row])
        cell.lblCell.text = foodNames[indexPath.row]
        
        return cell
    }

}

