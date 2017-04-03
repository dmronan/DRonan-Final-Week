//
//  WeatherLocation.swift
//  Weather Gift
//
//  Created by Dom Ronan on 3/25/17.
//  Copyright © 2017 Dom Ronan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherLocation {
    var name = ""
    var coordinates = ""
    var currentTemp = -999.9
    var dailySummary = ""
    var currentIcon = ""
    var currentTime = 0.0
    var timeZone = ""
    
    func getWeather(completed: @escaping () -> ()) {
        
        let weatherURL = urlBase + urlAPIKey + coordinates
        print(weatherURL)
        
        Alamofire.request(weatherURL).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if let temperature = json["currently"]["temperature"].double {
                    print("TEMP inside get Weather = \(temperature)")
                    self.currentTemp = temperature
                } else {
                    print("Could not return a temperature!")
                }
                if let summary = json["daily"]["summary"].string {
                    print("summary inside get Weather = \(summary)")
                    self.dailySummary = summary
                } else {
                    print("Could not return a summay!")
                }
                if let icon = json["currently"]["icon"].string {
                    print("summary inside Weather = \(icon)")
                    self.currentIcon = icon
                } else {
                    print("Could not return an icon!")
                }
                if let time = json["currently"]["time"].double {
                    print("TIME inside get Weather = \(time)")
                    self.currentTime = time
                } else {
                    print("Could not return a temperature!")
                }
                if let timeZone = json["timezone"].string {
                    print("TIMEZONE inside get Weather = \(timeZone)")
                    self.timeZone = timeZone
                } else {
                    print("Could not return a timezone!")
                }
            case .failure(let error):
            print(error)
            
        }
            print("****")
            completed()
    }
}
}

