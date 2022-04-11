//
//  SearchStockTableViewCell.swift
//  StockPrice
//
//  Created by Xiyue Suo on 4/10/22.
//

import UIKit

class SearchStockTableViewCell: UITableViewCell {

    @IBOutlet weak var lblSearchSymbol: UILabel!
    @IBOutlet weak var lblSearchName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
