//
//  City.swift
//  MaybeCloudy
//
//  Created by ToruYoshifuji on 2020/07/04.
//  Copyright © 2020 ToruYoshifuji. All rights reserved.
//

import Foundation

struct Weather: Decodable, Identifiable {
    var weatherDetail: WeatherDetail
    var id: Int
    var name: String

    enum CodingKeys: String, CodingKey {
        case weatherDetail = "weather"
        case id = "id"
        case name = "name"
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
