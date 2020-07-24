//
//  NewsVO.swift
//  TechNews
//
//  Created by Riki on 12/6/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import Foundation

struct NewsVO: Codable {
    var source: SourceVO?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    
    init() {
        self.source = SourceVO()
        self.author = ""
        self.title = ""
        self.description = ""
        self.url = ""
        self.urlToImage = ""
        self.publishedAt = ""
        self.content = ""
    }
}

struct SourceVO: Codable {
    var name: String
    
    init() {
        self.name = ""
    }
}
