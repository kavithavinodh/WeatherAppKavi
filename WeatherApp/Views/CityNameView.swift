//
//  CityNameView.swift
//  WeatherApp
//
//  Created by Kavitha Vinodh on 09/05/21.
//  Copyright © 2021 Kavitha Vinodh. All rights reserved.
//

import SwiftUI

struct CityNameView: View {
    var city: String
    var date: String
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 10){
            Text(city)
                .font(.title)
                .bold()
                Text(date)
            }.foregroundColor(.white)
    }
}
}
struct CityNameView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
