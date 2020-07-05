//
//  ContentView.swift
//  Tenki
//
//  Created by ToruYoshifuji on 2020/07/04.
//  Copyright © 2020 ToruYoshifuji. All rights reserved.
//

import SwiftUI

struct TenkiListView: View {
    @ObservedObject private var tenkiListVM = TenkiListViewModel()
    
    func getCityItem(cityId: Int) -> CityData {
        let cityItem = cityData.first(where: { $0.id == cityId})!
        return cityItem
    }

    var body: some View {
        NavigationView {
            List(tenkiListVM.weatherData) { weather in
                // TODO: ここでローカル変数cityを宣言してdestinationとRowで使いたい
                NavigationLink(
                    destination: TenkiDetailView(
                        weather: weather,
                        city: self.getCityItem(cityId: weather.id)
                    )
                ) {
                    TenkiListRow(
                        weather: weather,
                        city: self.getCityItem(cityId: weather.id)
                    )
                }
            }
            .navigationBarTitle(Text("お天気リスト"))
        }
    }
}

struct TenkiList_Previews: PreviewProvider {
    static var previews: some View {
        TenkiListView()
    }
}