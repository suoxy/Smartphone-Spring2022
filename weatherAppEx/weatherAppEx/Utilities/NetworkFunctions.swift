//
//  NetworkFunctions.swift
//  weatherAppEx
//
//  Created by Xiyue Suo on 4/9/22.
//

import Foundation
import PromiseKit
import Alamofire
import SwiftyJSON

func getLocationURL(_ lat : String, _ lng : String) -> String {
    let url = "\(locationAPIURL)\(apiKey)&q=\(lat),\(lng)"
    return url
}

func getCurrentWeatherURL(_ cityKey : String) -> String {
    let url = "\(currentWeatherURL)\(cityKey)?apikey=\(apiKey)"
    return url
}

func getLocationData(_ url : String) -> Promise<LocationModel>{
        return Promise<LocationModel> { seal -> Void in
            AF.request(url).responseJSON { response in
                
                if response.error != nil {
                    seal.reject(response.error!)
                }
                let location = LocationModel()
                // I will get data here
                
                let locationJSON = JSON(response.data!)
                
                location.key = locationJSON["Key"].stringValue  //"Key" : "2158137"
                location.city = locationJSON["EnglishName"].stringValue
                location.state = locationJSON["AdministrativeArea"]["EnglishName"].stringValue
                location.country = locationJSON["Country"]["EnglishName"].stringValue
                seal.fulfill(location) // I am fulfilling the promise
            }// end of response        }// end is return Promise
    }// end of function
}

func getCurrentWeather(_ url : String) -> Promise<CurrentWeatherModel>{
        return Promise<CurrentWeatherModel> { seal -> Void in
            AF.request(url).responseJSON { response in
                
                if response.error != nil {
                    seal.reject(response.error!)
                }
                let currentWeatherModel = CurrentWeatherModel("", "")
                // I will get data here
                
                let currentWeatherArray = JSON(response.data!).arrayValue
                
                guard let currentWeather = currentWeatherArray.first else
                { return seal.fulfill(currentWeatherModel)}
                
                
                currentWeatherModel.WeatherText = currentWeather["WeatherText"].stringValue  //"Key" : "2158137"
                currentWeatherModel.WeatherIcon = currentWeather["WeatherIcon"].intValue
                currentWeatherModel.IsDayTime = currentWeather["AdministrativeArea"]["EnglishName"].boolValue
                currentWeatherModel.Temperature = currentWeather["Temperature"]["Imperial"]["Value"].intValue
                
                seal.fulfill(currentWeatherModel) // I am fulfilling the promise
            }// end of response        }// end is return Promise
    }// end of function
}
