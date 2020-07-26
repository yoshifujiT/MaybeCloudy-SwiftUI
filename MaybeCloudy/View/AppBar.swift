//
//  AppBar.swift
//  MaybeCloudy
//
//  Created by ToruYoshifuji on 2020/07/21.
//  Copyright © 2020 ToruYoshifuji. All rights reserved.
//

import SwiftUI

struct AppBar: View {
    var body: some View {
        VStack {
            Text("MaybeCloudy")
                .font(.headline)
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 15)
        .padding(.bottom, 8)
        .background(Color("Primary"))
    }
}

struct AppBar_Previews: PreviewProvider {
    static var previews: some View {
        AppBar()
    }
}
