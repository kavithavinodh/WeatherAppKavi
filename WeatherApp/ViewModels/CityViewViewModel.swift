//
//  CityViewController.swift
//  WeatherApp
//
//  Created by Kavitha Vinodh on 09/05/21.
//  Copyright © 2021 Kavitha Vinodh. All rights reserved.
//

import SwiftUI
import CoreLocation

final class CityViewViewModel: ObservableObject {
    @Published var weather = weatherResponse.empty()
    @Published var city: String = "Chennai" {
        didSet{
            //get location here
            getLocation()
        }
    }
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
    private lazy var dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter
    }()
    private lazy var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh a"
        return formatter
    }()
    init(){
//       getLocation()
    }
    var date: String{
        return dateFormatter.string(from:Date(timeIntervalSince1970: TimeInterval(weather.current.dt)))
    }
    var weatherIcon: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].icon
        }
        return "sun.max.fill"
    }
    var temperature: String {
        return getTempFor(temp: weather.current.temp)
    }
    var conditions: String{
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].main
               }
        return ""
    }
    var windSpeed: String{
        return String(format: "%0.1f", weather.current.wind_speed )
    }
    var humidity: String{
        return String(format: "%d%%", weather.current.humidity )
    }
    var rainChances: String{
        return String(format: "%0.0f%%", weather.current.dew_point )
    }
    func getTimeFor(timestamp: Int) -> String{
        return timeFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    func getDayFor(timestamp: Int) -> String{
           return dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
       }
    func getTempFor(temp: Double) -> String {
        return String(format: "%0.1f", temp )
    }
    private func getLocation(){
    CLGeocoder().geocodeAddressString(city) { (placemarks, error) in
        if let places = placemarks, let place = places.first{
            self.getWeather(coord: place.location?.coordinate)
        }
    }
    }
    private func getWeather(coord: CLLocationCoordinate2D?){
        if let coord = coord{
            let urlString = API.getURLFor(lat: coord.latitude, lon: coord.longitude)
            getWeatherInternal(city: city, for: urlString)
        }else{
            let urlSting = API.getURLFor(lat: 37.5485, lon: -121.9886)
            getWeatherInternal(city: city, for: urlSting)
        }
    }
    private func getWeatherInternal(city: String, for urlString: String){
        NetworkManager<weatherResponse>.fetch(for: URL(string: urlString)!) { (result) in
            switch result {
            case .success(let response):DispatchQueue.main.async {
                self.weather = response
                }
            case .failure(let err) :
            print(err)
            }
    }
       
    }
// Adding Lottie Animation
    func getAnimationFor(icon:String) -> String {
        switch icon {
        case "01d":
            return "dayClearSky"
        case "01n":
            return "nightClearSky"
        case "02d":
            return "dayFewClouds"
        case "02n":
            return "nightFewClouds"
        case "03d":
            return "dayScatterdClouds"//
        case "03n":
            return "nightScatteredClouds"//
        case "04d":
            return "dayBrokenClouds"//
        case "04n":
            return "nightBrokenClouds"//
        case "09d":
            return "dayShowerRains"//finish
        case "09n":
            return "nightShowerRains"//finish
        case "10d":
            return "dayRain"//finish
        case "10n":
            return "nightRain"//finish
        case "11d":
            return "dayTunderstrom"//finish
        case "11n":
            return "nightTunderstrom"//finish
        case "13d":
            return "daySnow"//
        case "13n":
            return "nightSnow"//
        case "50d":
            return "dayMist"//
        case "50n":
            return "nightMist"//
        default:
            return "dayClearSky"
        }
    }
    
    func getWeathericonFor(icon:String) -> Image{
        switch icon {
        case "01d":
            return Image(systemName: "sun.max.fill")
        case "01n":
            return Image(systemName: "moon.fill")
        case "02d":
            return Image(systemName: "cloud.sun.fill")
        case "02n":
            return Image(systemName: "cloud.moon.fill")
        case "03d":
             return Image(systemName: "cloud.fill")
        case "03n":
             return Image(systemName: "cloud.fill")
        case "04d":
            return Image(systemName: "cloud.fill")
        case "04n":
            return Image(systemName: "cloud.fill")
        case "09d":
            return Image(systemName: "cloud.drizzle.fill")
        case "09n":
             return Image(systemName: "cloud.drizzle.fill")
        case "10d":
             return Image(systemName: "cloud.heavyrain.fill")
        case "11d":
             return Image(systemName: "cloud.bolt.fill")
        case "11n":
             return Image(systemName: "cloud.bolt.fill")
        case "13d":
             return Image(systemName: "cloud.snow.fill")
        case "13n":
            return Image(systemName: "cloud.snow.fill")
        case "50d":
            return Image(systemName: "cloud.fog.fill")
        case "50n":
            return Image(systemName: "cloud.fog.fill")
        default:
            return Image(systemName: "sun.max.fill")

        }
    }


    }
