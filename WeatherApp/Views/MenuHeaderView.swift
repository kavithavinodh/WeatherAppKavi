//
//  MenuHeaderView.swift
//  WeatherApp
//
//  Created by Kavitha Vinodh on 08/05/21.
//  Copyright © 2021 Kavitha Vinodh. All rights reserved.
//

import SwiftUI

struct ContentView(): View {
    @ObservedObject var cityVM: CityViewViewModel
    @State private var searchTerm = "Chennai"
    var body: some View {
        HStack{
            TextField("",text: $searchTerm)
                .padding(.leading, 20)
        Button {
            cityVM.city = searchTerm
            }
        label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(color.red)
                Image(systemName: "location.fill")
                }
        }
        .frame(width: 50, height: 50)
        }
        .foregroundColor(.white)
        .padding()
        .background(ZStack(alignment: .leading){
            Image(systemName: "maginifyingglass")
                .foregroundColor(.white)
                .padding(.leading, 10)
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue.opacity(0.5))
        })
}
}
        
    

struct MenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
