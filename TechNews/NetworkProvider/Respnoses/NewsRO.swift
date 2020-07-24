//
//  NewsResponse.swift
//  TechNews
//
//  Created by Riki on 12/6/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import Foundation

class NewsResponse: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [NewsVO]?
}
