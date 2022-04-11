//
//  StockTableViewCell.swift
//  StockPrice
//
//  Created by Xiyue Suo on 4/10/22.
//

import UIKit

class StockTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var lblStockSymbol: UILabel!
    
    var stockQuote = CurrentStockModel()
    
    var sendStockDelegate : SendStockDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func getPriceAction(_ sender: Any) {
        print(stockQuote.symbol)
        print(stockQuote.dayLow)
        sendStockDelegate?.sendStockData(stockQuote)
//
//        let currentURL = getCurrentStockURL(stockQuote.symbol)
//        getCurrentStock(currentURL).done { currentStockModel in
//            //currentStockModel.name = self.stockQuote.name
//            self.sendStockDelegate?.sendStockData(currentStockModel)
//        }
//        .catch { error in
//            print(error.localizedDescription)
//        }
        
    }
    
}
