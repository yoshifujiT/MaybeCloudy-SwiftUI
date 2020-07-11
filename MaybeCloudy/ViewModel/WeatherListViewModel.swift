//
//  WeatherListViewModel.swift
//  MaybeCloudy
//
//  Created by ToruYoshifuji on 2020/07/05.
//  Copyright © 2020 ToruYoshifuji. All rights reserved.
//

import Foundation

class WeatherListViewModel: ObservableObject {
    let cityIds = cityData.map({ $0.id })
    
    @Published var weatherData: [Weather] = []

    init() {
        let fetcher = WeatherTodayFetcher(cityIds: cityIds)
        
        fetcher.fetchWeatherData { (weather) in
            print(weather)
            self.weatherData = weather
        }
    }
}
