//
//  SearchViewController.swift
//  StockPrice
//
//  Created by Xiyue Suo on 4/10/22.
//

import UIKit

protocol AddStockDelegate {
    func addStockSymbol(symbol : String)
}

class SearchViewController: UIViewController {
    
    var addStockDelegate : AddStockDelegate?
    
    @IBOutlet weak var lblEnter: UILabel!
    @IBOutlet weak var txtEnter: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveAction(_ sender: Any) {
        guard let entered = txtEnter.text else {
            lblEnter.text = "Please enter again"
            return
        }
        
        addStockDelegate?.addStockSymbol(symbol: entered)
        self.navigationController?.popViewController(animated: true)
    }

}
