//
//  weatherResponse.swift
//  WeatherApp
//
//  Created by Kavitha Vinodh on 09/05/21.
//  Copyright © 2021 Kavitha Vinodh. All rights reserved.
//

import Foundation
struct weatherResponse: Codable {
var current : Weather
var hourly: [Weather]
var daily: [DailyWeather]
    
    static func empty() -> weatherResponse {
        return weatherResponse(current: Weather(), hourly: [Weather](repeating: Weather(), count: 23), daily: [DailyWeather](repeating: DailyWeather(), count: 8))
    }
}
