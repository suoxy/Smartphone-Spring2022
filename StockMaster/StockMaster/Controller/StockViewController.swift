//
//  StockViewController.swift
//  StockMaster
//
//  Created by Xiyue Suo on 2/27/22.
//

import UIKit
import RealmSwift
import SwiftUI

class StockViewController: UIViewController {

    let stockArr = ["FB", "MSFT", "GOOG", "AMZN"]
    
    var stockData : [QuoteShort] = []
    
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //print(Realm.Configuration.defaultConfiguration.fileURL?.path)
        // Do any additional setup after loading tview.
        loadStockData()
    }
    

}
