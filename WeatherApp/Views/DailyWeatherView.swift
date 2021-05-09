//
//  DailyWeatherView.swift
//  WeatherApp
//
//  Created by Kavitha Vinodh on 09/05/21.
//  Copyright © 2021 Kavitha Vinodh. All rights reserved.
//

import SwiftUI

struct DailyWeatherView: View {
    @ObservedObject var cityVM: CityViewViewModel
    var body: some View {
        ForEach(cityVM.weather.daily) { weather in
            if #available(iOS 14.0, *) {
                LazyVStack {
                    dailyCell(weather: weather)
                }
            } else {
                // Fallback on earlier versions
            }
        }
    }
    private func dailyCell(weather: DailyWeather) -> some View{
        HStack {
            Text(cityVM.getDayFor(timestamp: weather.dt).uppercased())
                .frame(width: 50)
            
            Spacer()
            Text("\(cityVM.getTempFor(temp: weather.temp.max)) | \(cityVM.getTempFor(temp: weather.temp.min))°F")
                .frame(width:150)
            Spacer()
            cityVM.getWeathericonFor(icon: weather.weather.count > 0 ? weather.weather[0].icon :"sun.max.fill")
        }
        .foregroundColor(.white)
        .padding(.horizontal, 40)
        .padding(.vertical, 15)
        .background(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .top, endPoint: .bottom)).opacity(0.3))
        .shadow(color: Color.white.opacity(0.1), radius:2, x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.2), radius:2, x: 2, y: 2)
    }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
