//
//  RemoteModel.swift
//  TechNews
//
//  Created by Riki on 12/6/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import Foundation

protocol RemoteModel {
    func fetchTopHeadlinesNews(
        success: @escaping([NewsVO])->Void,
        fail: @escaping(String)->Void
    )
    
    func fetchGermanySportNews(
        success: @escaping([NewsVO])->Void,
        fail: @escaping(String)->Void
    )
    
    func fetchArgentinaSportNews(
        success: @escaping([NewsVO])->Void,
        fail: @escaping(String)->Void
    )
}
