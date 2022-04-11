//
//  ProtocolSendWeatherData.swift
//  weatherAppEx
//
//  Created by Xiyue Suo on 4/9/22.
//

import Foundation

protocol SendWeatherDelegate {
    func sendWeatherData(_ currentWeatherModel : CurrentWeatherModel)
}
