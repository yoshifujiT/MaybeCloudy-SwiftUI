//
//  ContentView.swift
//  MaybeCloudy
//
//  Created by ToruYoshifuji on 2020/07/04.
//  Copyright © 2020 ToruYoshifuji. All rights reserved.
//

import SwiftUI

struct WeatherListView: View {
    @ObservedObject private var weatherListVM = WeatherListViewModel()
    let dt = Date()
    let dateFormatter = DateFormatter()
    
    func getCityItem(cityId: Int) -> CityData {
        let cityItem = cityData.first(where: { $0.id == cityId})!
        return cityItem
    }
    
    func getDate() -> String {
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "Md", options: 0, locale: Locale(identifier: "ja_JP"))
        return dateFormatter.string(from: dt)
    }

    var body: some View {
        VStack(spacing: 0) {
            AppBar()
            NavigationView {
                ZStack {
                    Color("Gray01")

                    VStack(spacing: 0) {
                        ScrollView(showsIndicators: false){
                            Spacer()
                                .frame(height: 16)
                            VStack(alignment: .leading, spacing: 0) {
                                Text("お気に入り都道府県の \(getDate()) の天気")
                                    .foregroundColor(Color.black)
                                    .fontWeight(.bold)
                                    .padding(.top, 8)
                                    .padding(.bottom, 12)
                                VStack(spacing: 0) {
                                    ForEach(weatherListVM.weatherData) { weather in
                                        // TODO: ここでローカル変数cityを宣言してdestinationとRowで使いたい
                                        NavigationLink(
                                            destination: WeatherDetailView(
                                                weather: weather,
                                                city: self.getCityItem(cityId: weather.id)
                                            )
                                        ) {
                                            WeatherListRow(
                                                weather: weather,
                                                city: self.getCityItem(cityId: weather.id)
                                            )
                                        }
                                        if weather.id != self.weatherListVM.weatherData.last!.id {
                                            Rectangle()
                                                .fill(Color("Gray02"))
                                                .frame(height: 1)
                                        }
                                    }
                                }
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(Color.white)
                                .clipped()
                                .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                            }
                            .padding(.horizontal, 16)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            Spacer()
                                .frame(height: 16)
                        }
                        .navigationBarTitle("天気一覧")
                        .navigationBarHidden(true)
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct WeatherList_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListView()
    }
}
