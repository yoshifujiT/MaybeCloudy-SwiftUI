//
//  URLImage.swift
//  MaybeCloudy
//
//  Created by ToruYoshifuji on 2020/07/19.
//  Copyright © 2020 ToruYoshifuji. All rights reserved.
//

import SwiftUI

struct URLImage<Content>: View where Content: View {
    @ObservedObject var imageLoader = ImageLoader()

    private let url: String
    private let content: (_ image: Image) -> Content

    init(url: String, content: @escaping (_ image: Image) -> Content) {
        self.url = url
        self.content = content
    }

    var body: some View {
        ZStack {
            imageLoader.image != nil
                ? content(imageLoader.image!)
                : content(Image("default"))
        }.onAppear {
            self.imageLoader.load(url: self.url)
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "") {
            $0
        }
    }
}
