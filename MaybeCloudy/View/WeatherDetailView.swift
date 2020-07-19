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
                name: "city name",
                weatherDetail: [
                    WeatherDetail(
                        id: 111,
                        main: "Cloudy",
                        description: "description",
                        icon: "02n"
                    )
                ],
                weatherMain: WeatherMain(
                    temp: 25,
                    tempMin: 25,
                    tempMax: 25,
                    humidity: 83
                ),
                wind: Wind(
                    speed: 2.1,
                    deg: 30
                )
            ),
            city: cityData[0]
        )
    }
}
