//
//  City.swift
//  MaybeCloudy
//
//  Created by ToruYoshifuji on 2020/07/04.
//  Copyright © 2020 ToruYoshifuji. All rights reserved.
//

import Foundation

struct Weather: Decodable, Identifiable {
    var id: Int
    var name: String
    var weatherDetail: [WeatherDetail]
    var weatherMain: WeatherMain
    var wind: Wind

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case weatherDetail = "weather"
        case weatherMain = "main"
        case wind = "wind"
    }
}

struct WeatherDetail: Decodable, Identifiable {
    var id: Int
    var main: String
    var description: String
    var icon: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case main = "main"
        case description = "description"
        case icon = "icon"
    }
}

struct WeatherMain: Decodable {
    var temp: Double!
    var tempMin: Double! // 最低気温
    var tempMax: Double! // 最高気温
    var humidity: Double! // 湿度

    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case humidity = "humidity"
    }
}

struct Wind: Decodable {
    var speed: Double!
    var deg: Int
    
    enum CodingKeys: String, CodingKey {
        case speed = "speed"
        case deg = "deg"
    }
}
