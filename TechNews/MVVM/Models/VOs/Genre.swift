//
//  Genre.swift
//  TechNews
//
//  Created by Riki on 12/2/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import Foundation

struct Genre {
    var image: String
    var title: String
    
    init(image: String, title: String) {
        self.image = image
        self.title = title
    }
    
    static func fetchData()->[Genre] {
        return [
            Genre(image: "laliga", title: "LaLiga News"),
            Genre(image: "premier", title: "PremierLeague News"),
            Genre(image: "bundesliga", title: "Bundesliga News"),
            Genre(image: "seriesa", title: "SerieA News")
        ]
    }
}
