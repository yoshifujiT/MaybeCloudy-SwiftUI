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
    
    func getCityItem(cityId: Int) -> CityData {
        let cityItem = cityData.first(where: { $0.id == cityId})!
        return cityItem
    }

    var body: some View {
        ZStack {
            Color("Gray01")
                .edgesIgnoringSafeArea(.all)
    
            VStack {
                AppBar()
                Spacer()
                NavigationView {
                    List(weatherListVM.weatherData) { weather in
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
                        }.background(Color.clear)
                    }
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                }
                .background(Color.green)
            }.edgesIgnoringSafeArea(.top)
        }
    }
}

struct WeatherList_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListView()
    }
}
