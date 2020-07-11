//
//  WeatherDetail.swift
//  MaybeCloudy
//
//  Created by ToruYoshifuji on 2020/07/05.
//  Copyright © 2020 ToruYoshifuji. All rights reserved.
//

import SwiftUI

struct WeatherDetailView: View {
    var weather: Weather
    var city: CityData

    var body: some View {
        Text(city.label)
    }
}

struct WeatherDetail_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailView(
            weather: Weather(
                id: 111,
                name: "city name"
            ),
            city: cityData[0]
        )
    }
}
