//
//  ViewController.swift
//  SearchBarExample
//
//  Created by Xiyue Suo on 3/6/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    var namesArray = ["Ashish", "Ashley", "Amanda", "Mark", "Mike", "Marissa", "Mary"]
    var copyArray = ["Ashish", "Ashley", "Amanda", "Mark", "Mike", "Marissa", "Mary"]
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = namesArray[indexPath.row]
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchBar.text!.isEmpty else { // if the searchBar.text is not empty Proceed ekse restore original array
            namesArray = copyArray
            tblView.reloadData()
            return
        }
        
        namesArray = copyArray.filter({ name in
            name.lowercased().contains(searchBar.text!.lowercased())
        })
        
        tblView.reloadData()
    }

}

