//
//  Api+Extensions.swift
//  WeatherApp
//
//  Created by Kavitha Vinodh on 09/05/21.
//  Copyright © 2021 Kavitha Vinodh. All rights reserved.
//

import Foundation
// Create a Baseurl
extension API {
    static let baseURLString = "https://api.openweathermap.org/data/2.5/"
    static func getURLFor(lat: Double, lon: Double) -> String {
        return "\(baseURLString)onecall?lat={lat}&lon={lon}&exclude=minutely&appid=\(key)&units=imperial"
}
}
