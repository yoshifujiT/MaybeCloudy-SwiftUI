//
//  WeatherDetail.swift
//  MaybeCloudy
//
//  Created by ToruYoshifuji on 2020/07/05.
//  Copyright © 2020 ToruYoshifuji. All rights reserved.
//

import SwiftUI

struct WeatherDetailView: View {
    var weather: Weather
    var city: CityData

    var body: some View {
        ZStack {
            Color("Gray01")
                .edgesIgnoringSafeArea(.all)

            ScrollView(showsIndicators: false){
                VStack(alignment: .leading, spacing: 0) {
                    Text(city.label)
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                        .padding(.top, 8)
                        .padding(.bottom, 12)
                    VStack {
                        Text("hogehoge")
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                    .background(Color.white)
                    .clipped()
                    .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                .padding(16)
                Spacer()
                    .frame(height: 16)
            }
            .navigationBarTitle("\(city.label)の天気", displayMode: .inline)
        }
    }
}

struct WeatherDetail_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailView(
            weather: Weather(
                id: 111,
                name: "city name",
                weatherDetail: [
                    WeatherDetail(
                        id: 111,
                        main: "Cloudy",
                        description: "description",
                        icon: "02n"
                    )
                ],
                weatherMain: WeatherMain(
                    temp: 25,
                    tempMin: 25,
                    tempMax: 25,
                    humidity: 83
                ),
                wind: Wind(
                    speed: 2.1,
                    deg: 30
                )
            ),
            city: cityData[0]
        )
    }
}
