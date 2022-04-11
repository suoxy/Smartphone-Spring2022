//
//  TableViewCode.swift
//  StockPrice
//
//  Created by Xiyue Suo on 4/10/22.
//

import Foundation
import UIKit

extension ViewController : UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocksModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = stocks[indexPath.row]
//
//        return cell

        let cell = Bundle.main.loadNibNamed("StockTableViewCell", owner: self, options: nil)?.first as! StockTableViewCell
        let stockModel = stocksModel[indexPath.row]
        cell.lblCompanyName.text = stockModel.name
        cell.lblStockSymbol.text = stockModel.symbol
        
        cell.stockQuote = stockModel
        
        cell.sendStockDelegate = self
        
        return cell
    }
}
