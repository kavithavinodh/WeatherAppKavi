  //
//  CityView.swift
//  WeatherApp
//
//  Created by Kavitha Vinodh on 09/05/21.
//  Copyright © 2021 Kavitha Vinodh. All rights reserved.
//

import SwiftUI

struct CityView: View {
    @ObservedObject var cityVM: CityViewViewModel
    var body: some View {
        VStack {
            CityNameView(city: cityVM.city, date: cityVM.date)
            .shadow(radius: 0)
            TodayWeatherView(cityVM: cityVM)
            HourlyView(cityVM: cityVM)
            DailyWeatherView(cityVM: cityVM)
        }.padding(.bottom, 30)
}
  }
struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
