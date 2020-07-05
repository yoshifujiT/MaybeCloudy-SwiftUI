//
//  TenkiListRow.swift
//  Tenki
//
//  Created by ToruYoshifuji on 2020/07/05.
//  Copyright © 2020 ToruYoshifuji. All rights reserved.
//

import SwiftUI

struct TenkiListRow: View {
    let weather: Weather
    let city: CityData
    
    var body: some View {
        Text(city.label)
    }
}

struct TenkiListRow_Previews: PreviewProvider {
    static var previews: some View {
        TenkiListRow(
            weather: Weather(
                id: 111,
                name: "city name"
            ),
            city: cityData[0]
        )
    }
}

