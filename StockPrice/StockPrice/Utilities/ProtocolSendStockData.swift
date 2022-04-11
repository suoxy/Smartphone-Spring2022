//
//  ProtocolSendStockData.swift
//  StockPrice
//
//  Created by Xiyue Suo on 4/10/22.
//

import Foundation

protocol SendStockDelegate {
    func sendStockData(_ currentStockModel : CurrentStockModel)
}
