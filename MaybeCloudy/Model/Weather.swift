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

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case weatherDetail = "weather"
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
