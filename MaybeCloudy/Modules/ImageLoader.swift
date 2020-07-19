//
//  ImageLoader.swift
//  MaybeCloudy
//
//  Created by ToruYoshifuji on 2020/07/19.
//  Copyright © 2020 ToruYoshifuji. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()

    var image: Image? {
        willSet {
            objectWillChange.send()
        }
    }

    func load(url: String) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: image)
            }
        }.resume()
    }
}
