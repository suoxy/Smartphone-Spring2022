//
//  ViewController.swift
//  StockPrice
//
//  Created by Xiyue Suo on 4/10/22.
//

import UIKit

class ViewController: UIViewController, SendStockDelegate {
    
    let stocks = ["FB", "AAPL", "GOOG", "MSFT", "AMZN"]

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var lblSymbol: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDayHigh: UILabel!
    @IBOutlet weak var lblDayLow: UILabel!

    var stocksModel: [CurrentStockModel] = [CurrentStockModel]()
    var sendStockDelegate : SendStockDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initializeStocks()
    }
    
    func initializeStocks() {
        for stock in stocks {
            let url = getCurrentStockURL(stock)
            sleep(1)
            getCurrentStock(url)
                .done { stockModel in
                    self.stocksModel.append(stockModel)
                    if (stockModel.symbol == "AAPL") {
                        self.sendStockData(stockModel)
                    }
                    self.tblView.reloadData()
                }
                .catch { error in
                    print(error.localizedDescription)
                }
        }
    }
    
    func sendStockData(_ currentStockModel: CurrentStockModel) {
//        print(currentStockModel.dayLow)
//        print(currentStockModel.dayHigh)
        lblCompanyName.text = "Name: " + currentStockModel.name
        lblSymbol.text = "Symbol: " + currentStockModel.symbol
        lblPrice.text = "Stock Price: $ \(currentStockModel.price)"
        lblDayLow.text = "Day Low: $ \(currentStockModel.dayLow)"
        lblDayHigh.text = "Day High: $ \(currentStockModel.dayHigh)"
    }
    
    


}

