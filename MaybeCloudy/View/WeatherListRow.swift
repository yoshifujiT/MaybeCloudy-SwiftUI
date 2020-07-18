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
    
    var body: some View {
        Text(city.label)
    }
}

struct WeatherListRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListRow(
            weather: Weather(
                weatherDetail: WeatherDetail(
                    id: 111,
                    main: "Cloudy",
                    description: "description",
                    icon: "icon"
                ),
                id: 111,
                name: "city name"
            ),
            city: cityData[0]
        )
    }
}

