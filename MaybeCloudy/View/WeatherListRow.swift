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
                .font(.headline)
                .foregroundColor(Color("TextBlack"))
            Spacer()
            VStack(spacing: 0) {
                URLImage(url: getIconURL()) {
                    $0.renderingMode(.original)
                        .resizable()
                        .frame(width: 60.0, height: 60.0, alignment: .center)
                }
                Text(getWeatherDetail().description)
                    .font(.caption)
                    .foregroundColor(Color("TextBlack"))
            }
            .frame(width: 90, alignment: .center)
            HStack {
                Text(String(round(weather.weatherMain.tempMax * 10) / 10)).foregroundColor(Color("Alert"))
                Text("/").foregroundColor(Color.gray)
                Text(String(round(weather.weatherMain.tempMin * 10) / 10)).foregroundColor(Color("Primary"))
            }
            .font(.subheadline)
            .frame(width: 90, alignment: .trailing)
        }
        .padding(.top, 5)
        .padding(.bottom, 10)
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
                        description: "曇りがち",
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

