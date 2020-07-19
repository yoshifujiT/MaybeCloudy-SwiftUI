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
    
    func getIconURL() -> String {
        let iconCode = getWeatherDetail().icon
        return Util.getIconNameByCode(iconCode: iconCode)
    }
    
    var body: some View {
        HStack {
            Text(city.label)
            Text(getWeatherDetail().main)
            Text(getWeatherDetail().description)
            URLImage(url: getIconURL()) {
                $0.renderingMode(.original)
                    .resizable()
                    .frame(width: 50.0, height: 50.0)
            }
            HStack {
                Text(String(weather.weatherMain.tempMax))
                Text("/")
                Text(String(weather.weatherMain.tempMin))
            }
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
                        icon: "02d"
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

