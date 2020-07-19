//
//  Util.swift
//  MaybeCloudy
//
//  Created by ToruYoshifuji on 2020/07/19.
//  Copyright © 2020 ToruYoshifuji. All rights reserved.
//

import Foundation

class Util {
    class func getIconNameByCode(iconCode: String) -> String {
        return "https://openweathermap.org/img/wn/\(iconCode)@2x.png"
    }
}
