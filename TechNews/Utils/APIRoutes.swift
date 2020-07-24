//
//  APIRoutes.swift
//  TechNews
//
//  Created by Riki on 12/6/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import Foundation

class APIRoutes {
    static let topHeadlinesRoute: String = "\(API.BASE_URL)top-headlines?country=gb&category=sports&apiKey=\(API.API_KEY)"
    static let germanySportNewsRoute: String = "\(API.BASE_URL)top-headlines?country=de&category=sports&apiKey=\(API.API_KEY)"
    static let argentinaSportNewsRoute: String = "\(API.BASE_URL)top-headlines?country=ar&category=sports&apiKey=\(API.API_KEY)"
}
