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

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //print(Realm.Configuration.defaultConfiguration.fileURL?.path)
        // Do any additional setup after loading the view.
        loadStockValues()
    }
    

    @IBAction func addDB(_ sender: Any) {
        
        let stock = StockShort()
        stock.symbol = "AAPL"
        stock.price = 120.96
        stock.volume = 332607163
        
        do {
            let realm = try Realm()
            
            try realm.write({
                realm.add(stock, update: .modified)
            })
        } catch {
            print("error in writing to DB")
        }
    }
    
    func loadStockValues() {
        
        do {
            let realm = try Realm()
            let stocks = realm.objects(StockShort.self)
            
            print(stocks)
            
            for stock in stocks {
                print(stock.symbol)
            }
        } catch {
            print("Error in reading Realm DB")
        }
        
    }
    
    func getTslaStock() -> StockShort {
        do {
            let realm = try Realm()
            let stocks = realm.objects(StockShort.self)
            
            print(stocks)
            
            for stock in stocks {
                if stock.symbol == "TSLA" {
                    return stock
                }
                print(stock.symbol)
            }
        } catch {
            print("Error in reading Realm DB")
        }
        
        return StockShort()
    }
    
    func deleteStockFromDB(stock : StockShort) {
        do {
            let realm = try Realm()
            try realm.write({
                realm.delete(stock)
            })
        } catch {
            print("Unable to delete from Realm DB")
        }
    }
    
    
    @IBAction func deleteTSLAStock(_ sender: Any) {
        let tsla = getTslaStock()
        //tsla.symbol = "TSLA"
        deleteStockFromDB(stock: tsla)
    }
    
    func addStocksAction (symbol : String) {
        let stock = StockShort()
        stock.symbol = "AAPL"
        stock.price = 120.96
        stock.volume = 332607163
        
        do {
            let realm = try Realm()
            
            try realm.write({
                realm.add(stock, update: .modified)
            })
        } catch {
            print("error in writing to DB")
        }
    }
    
    func addStockToDB(symbol : String) {
        let stock = StockShort()
        stock.symbol = symbol
        do {
            let realm = try Realm()
            try realm.write({
                realm.add(stock, update: .modified)
            })
        } catch {
            print("Error in writing to db")
        }
    }
    
    @IBAction func addStocksAction(_ sender: Any) {
        
        var txtField : UITextField?
        
        let alertController = UIAlertController(title: "Add Stock", message: "", preferredStyle: .alert)
        
        let OKButton = UIAlertAction(title: "OK", style: .default) {  action in
            guard let symbol = txtField?.text else {
                return
            }
            self.addStockToDB(symbol: symbol)
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) {  action in
            
        }
        
        alertController.addAction(OKButton)
        alertController.addAction(cancelButton)
        
        alertController.addTextField { stockTextField in
            stockTextField.placeholder = "Type stoc ksymbol"
            txtField = stockTextField
        }
        
        self.present(alertController, animated: true, completion: nil)
    }

}
