//
//  TenkiListViewModel.swift
//  Tenki
//
//  Created by ToruYoshifuji on 2020/07/05.
//  Copyright © 2020 ToruYoshifuji. All rights reserved.
//

import Foundation

class TenkiListViewModel: ObservableObject {
    let cityIds = cityData.map({$0.id})
    
    @Published var weatherData: [City] = []

    init() {
        let fetcher = WeatherTodayFetcher(cityIds: self.cityIds)
        
        fetcher.fetchWeatherData { (weather) in
            print(weather)
            self.weatherData = weather
        }
    }
}
