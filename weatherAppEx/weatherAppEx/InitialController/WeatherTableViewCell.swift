//
//  WeatherTableViewCell.swift
//  weatherAppEx
//
//  Created by Xiyue Suo on 4/9/22.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCity: UILabel!
    
    var cityKey = ""
    var city = ""
    
    var sendWeatherDelegate : SendWeatherDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func getWeatherAction(_ sender: Any) {
        
        let currentURL = getCurrentWeatherURL(cityKey)
        
        getCurrentWeather(currentURL).done { currentWeatherModel in
            currentWeatherModel.city = self.city
            self.sendWeatherDelegate?.sendWeatherData(currentWeatherModel)
        }
        .catch { error in
            print(error.localizedDescription)
        }
    }
    
}
