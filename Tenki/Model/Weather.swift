//
//  City.swift
//  Tenki
//
//  Created by ToruYoshifuji on 2020/07/04.
//  Copyright © 2020 ToruYoshifuji. All rights reserved.
//

import Foundation

struct Weather: Decodable, Identifiable {
    var id: Int
    var name: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
}
