//
//  StockViewTableViewCode.swift
//  StockMaster
//
//  Created by Xiyue Suo on 3/6/22.
//

import Foundation
import UIKit

extension StockViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(stockData[indexPath.row].symbol) : \(stockData[indexPath.row].price)"
        return cell
    }
    
    func loadStockData() {
        getAllStockValues(stockArr).done { quotes in
            self.stockData = []
            for i in 0 ... quotes.count - 1 {
                print("\(quotes[i].symbol) : \(quotes[i].price)")
                self.stockData.append(quotes[i])
            }
            self.tblView.reloadData()
        }.catch { error in
            print(error.localizedDescription)
        }
    }
    
}
