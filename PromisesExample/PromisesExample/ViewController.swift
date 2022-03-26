//
//  ViewController.swift
//  PromisesExample
//
//  Created by Xiyue Suo on 3/6/22.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner
import PromiseKit
import SystemConfiguration

class ViewController: UIViewController {

    let urlShortQuote = "https://financialmodelingprep.com/api/v3/quote-short/FB?apikey="
    let apiKey = "fb50eac0cf5e33e571aa3275de628e2c"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getDataAction(_ sender: Any) {
        let url = urlShortQuote + apiKey
        getStockData(url).done { quote in
            print(quote.price)
            print(quote.volume)
            print(quote.symbol)
        }.catch { error in
            print(error.localizedDescription)
        }
        /*
        let url = urlShortQuote + apiKey
        AF.request(url).responseJSON { response in
            if response.error != nil {
                print(response.error!.localizedDescription)
                return
            }
            // If I am here then I have got the data
            let stocks = JSON(response.data!).array
            guard let stock = stocks!.first else { return}
            
            print(stock)
            let quote = QuoteShort()
            quote.symbol = stock["symbol"].stringValue
            quote.price = stock["price"].floatValue
            quote.volume = stock["volume"].intValue
        }
        print("i am here")
         */
        
    }
    
    func getStockData(_ url : String) -> Promise<QuoteShort> {
        
        return Promise<QuoteShort> { seal -> Void in
            AF.request(url).responseJSON { response in
                if response.error != nil {
                    seal.reject(response.error!)
                }
                
                let stocks = JSON(response.data!).array
                guard let stock = stocks!.first else { return}
                
                print(stock)
                let quote = QuoteShort()
                quote.symbol = stock["symbol"].stringValue
                quote.price = stock["price"].floatValue
                quote.volume = stock["volume"].intValue
                
                seal.fulfill(quote)
            } // end of response
        }//end is return prominse
    }//end of function
    
    func funcWithUnderScore (_url : String) {
        //print(url)
    }
    
    func funcWithoutUnderScore (url : String) {
    
    }
}

