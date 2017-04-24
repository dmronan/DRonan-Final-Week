//
//  WeatherUserDefault.swift
//  Weather Gift
//
//  Created by Dom Ronan on 4/24/17.
//  Copyright © 2017 Dom Ronan. All rights reserved.
//

import Foundation

class WeatherUserDefault: NSObject, NSCoding {
    
    var name = ""
    var coordinates = ""

    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder){
        name = aDecoder.decodeObject(forKey: "name") as! String
        coordinates = aDecoder.decodeObject(forKey: "coordinates") as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(coordinates, forKey: "coordinates")
    }
    
}
