//
//  WeatherListRow.swift
//  MaybeCloudy
//
//  Created by ToruYoshifuji on 2020/07/05.
//  Copyright © 2020 ToruYoshifuji. All rights reserved.
//

import SwiftUI

struct WeatherListRow: View {
    let weather: Weather
    let city: CityData

    func getWeatherDetail() -> WeatherDetail {
        return weather.weatherDetail[0]
    }
    
    var body: some View {
        VStack {
            Text(city.label)
            Text(getWeatherDetail().main)
            Text(getWeatherDetail().description)
        }
    }
}

struct WeatherListRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListRow(
            weather: Weather(
                id: 111,
                name: "city name",
                weatherDetail: [
                    WeatherDetail(
                        id: 111,
                        main: "Cloudy",
                        description: "description",
                        icon: "icon"
                    )
                ]
            ),
            city: cityData[0]
        )
    }
}

