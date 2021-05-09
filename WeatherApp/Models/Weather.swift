//
//  weather.swift
//  WeatherApp
//
//  Created by Kavitha Vinodh on 09/05/21.
//  Copyright © 2021 Kavitha Vinodh. All rights reserved.
//

import Foundation
// Model class for weather response
struct Weather : Codable, Identifiable {
    var dt : Int
    var temp: Double
    var feels_like: Double
    var pressure: Int
    var humidity: Int
    var dew_point: Double
    var clouds: Double
    var wind_speed: Double
    var wind_deg: Int
    var weather: [WeatherDetail]
    
    enum CodingKey : String {
    case dt
    case temp
    case feels_like
    case pressure
    case humidity
    case dew_point
    case clouds
    case wind_speed
    case wind_deg
    case weather
    }
    init() {
        dt = 0
        temp = 0.0
        feels_like = 0.0
        pressure = 0
        humidity = 0
        dew_point = 0.0
        clouds = 0.0
        wind_speed = 0.0
        wind_deg = 0
        weather = []
    
    }
    
}
extension Weather {
    var id: UUID {
        return UUID()
        
    }
}
    

