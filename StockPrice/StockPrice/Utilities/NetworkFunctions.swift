//
//  NetworkFunctions.swift
//  StockPrice
//
//  Created by Xiyue Suo on 4/10/22.
//

import Foundation
import PromiseKit
import Alamofire
import SwiftyJSON


func getCurrentStockURL(_ symbol : String) -> String {
    let url = urlCompanyQuote + symbol + "/?apikey=" + apiKey
    return url
}

func getCurrentStock(_ url : String) -> Promise<CurrentStockModel>{
        return Promise<CurrentStockModel> { seal -> Void in
            AF.request(url).responseJSON { response in
                
                if response.error != nil {
                    seal.reject(response.error!)
                }
                let currentStockModel = CurrentStockModel()
                // I will get data here
                
                let currentStockArray = JSON(response.data!).arrayValue
                
                guard let currentStock = currentStockArray.first else
                { return seal.fulfill(currentStockModel)}
                
                currentStockModel.name = currentStock["name"].stringValue
                currentStockModel.symbol = currentStock["symbol"].stringValue
                currentStockModel.dayLow = currentStock["dayLow"].doubleValue
                currentStockModel.dayHigh = currentStock["dayHigh"].doubleValue
                currentStockModel.price = currentStock["price"].doubleValue
                
                seal.fulfill(currentStockModel) // I am fulfilling the promise
            }// end of response        }// end is return Promise
    }// end of function
}
