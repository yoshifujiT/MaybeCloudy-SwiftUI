//
//  City.swift
//  MaybeCloudy
//
//  Created by ToruYoshifuji on 2020/07/04.
//  Copyright © 2020 ToruYoshifuji. All rights reserved.
//

import Foundation

struct CityData: Decodable, Identifiable {
    var id: Int
    var name: String
    var label: String
    var rank: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case label
        case rank
    }
}
