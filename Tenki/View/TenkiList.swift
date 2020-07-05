//
//  ContentView.swift
//  Tenki
//
//  Created by ToruYoshifuji on 2020/07/04.
//  Copyright © 2020 ToruYoshifuji. All rights reserved.
//

import SwiftUI

struct TenkiList: View {
   
    @ObservedObject private var tenkiListVM = TenkiListViewModel()

    var body: some View {
        NavigationView {
            List(tenkiListVM.weatherData) { weather in
                Text(weather.name)
            }
            .navigationBarTitle(Text("お天気リスト"))
        }
    }
}

struct TenkiList_Previews: PreviewProvider {
    static var previews: some View {
        TenkiList()
    }
}
