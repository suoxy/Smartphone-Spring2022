//
//  ViewController.swift
//  ClassicTableView
//
//  Created by Xiyue Suo on 1/28/22.
//

import UIKit

/*
 1. add a Table View to the story board
 2. add a table view cell to the table view
 3. create identifier for table view cell and call it "cell"
 4. create outlet of table view to the code call the table view as "tblView"
 5. add protocols UITableViewDelegate, UITableViewDataSource to the class
 6. add functions for table view numberOfRowsInSection and cellForRowAt
 7. in view did load add tblView.delegate = self and tblView.dataSource = self
 9. create an array for data values
 9. return array.count in numberOfRowInSection function
 10. fill the cellForRowAt function
 */

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblView: UITableView!
    
    let arr = ["Mark", "Bill", "Peter", "John", "Tom"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arr[indexPath.row]
        return cell
    }
    
}

