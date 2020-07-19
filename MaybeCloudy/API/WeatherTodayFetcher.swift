//
//  WeatherFetcheRequest.swift
//  MaybeCloudy
//
//  Created by ToruYoshifuji on 2020/07/04.
//  Copyright © 2020 ToruYoshifuji. All rights reserved.
//

import Foundation

class WeatherTodayFetcher {
    let apikey = ProcessInfo.processInfo.environment["OPEN_WEATHER_MAP_API_KEY"]
    let baseUrl = "https://api.openweathermap.org/data/2.5/group"
    let cityIds: [Int]

    init(cityIds: [Int]) {
        self.cityIds = cityIds
    }
    
    var url: URL {
        let id = cityIds.map({ String(describing: $0) }).joined(separator: ",")
        print(id)
        // TODO: apikeyが見つからない場合のエラー処理
        let str = "\(baseUrl)?id=\(id)&APPID=\(apikey!)&lang=ja&units=metric"

        return URL(string: str)!
    }

    func fetchWeatherData(completion: @escaping ([Weather]) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            let decoder: JSONDecoder = JSONDecoder()
            do {
                let result = try decoder.decode(TopCities.self, from: data)
                DispatchQueue.main.async {
                    completion(result.list)
                }
            } catch {
                print("json convert failed in JSONDecoder. " + error.localizedDescription)
            }
        }.resume()
    }
}
