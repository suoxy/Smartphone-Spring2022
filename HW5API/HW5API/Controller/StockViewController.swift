//
//  StockViewController.swift
//  HW5API
//
//  Created by Xiyue Suo on 2/26/22.
//

import UIKit
import SwiftyJSON
import SwiftSpinner
import Alamofire

class StockViewController: UIViewController {

    @IBOutlet weak var txtStockSymbol: UITextField!
    
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblDCF: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func getStockDCF(_ sender: Any) {
        guard let symbol = txtStockSymbol.text else {
            return
        }
        let url = "\(DCFURL)\(symbol.uppercased())?apikey=\(apiKey)"
        
        print(url)
        SwiftSpinner.show("Getting Stock Info For \(symbol)")
        
        AF.request(url).responseJSON { response in
            SwiftSpinner.hide(nil)
            if response.error != nil {
                print(response.error!)
                return
            }
            // got data here
            let stocks = JSON(response.data!).array
            
            guard let stock = stocks!.first else {
                return
            }
            
            print(stock)
            let stockInfo = DCF()
            stockInfo.symbol = stock["symbol"].stringValue
            stockInfo.date = stock["date"].stringValue
            stockInfo.dcf = stock["dcf"].floatValue
            stockInfo.price = stock["Stock Price"].floatValue
            
            self.lblDate.text = "Date: \(stockInfo.date)"
            self.lblDCF.text = "dcf: $\(stockInfo.dcf)"
            self.lblPrice.text = "Stock Price: $\(stockInfo.price)"
        }
    }
    
}
