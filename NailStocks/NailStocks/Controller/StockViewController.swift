//
//  StockViewController.swift
//  NailStocks
//
//  Created by Xiyue Suo on 2/20/22.
//

import UIKit
import SwiftyJSON
import SwiftSpinner
import Alamofire

class StockViewController: UIViewController {

    @IBOutlet weak var txtStockSymbol: UITextField!
    @IBOutlet weak var lblStockPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func getStockPrice(_ sender: Any) {
        
        guard let symbol = txtStockSymbol.text else { return }
        
        
        let url = "\(shortQuoteURL)\(symbol.uppercased())?apikey=\(apiKey)"
        //"https://financialmodelingprep.com/api/v3/quote-short/AAPL?apikey=YOUR_API_KEY"
        print(url)
        
        SwiftSpinner.show("Getting Stock Value for \(symbol)")
        AF.request(url).responseJSON { response in
            SwiftSpinner.hide(nil)
            if response.error != nil {
                print(response.error!)
                return
            }
            // here means i got the data
            //print(response.data!)
            let stocks = JSON(response.data!).array
            
            guard let stock = stocks!.first else { return }
            print(stocks)
            
            let quote = ShortQuote()
            
            quote.symbol = stock["symbol"].stringValue
            quote.price = stock["price"].floatValue
            quote.volume = stock["volume"].intValue
            
            self.lblStockPrice.text = "\(quote.symbol) : \(quote.price) $"
        }
        
    }
    

}
