//
//  SharedRemoteModel.swift
//  TechNews
//
//  Created by Riki on 12/6/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import Foundation

class SharedRemoteModel: BaseApiClient {
    
    private static var sharedRemoteModel: SharedRemoteModel = {
        return SharedRemoteModel()
    }()
    
    class func shared()->SharedRemoteModel {
        return sharedRemoteModel
    }
    
}

extension SharedRemoteModel: RemoteModel {
    func fetchArgentinaSportNews(success: @escaping ([NewsVO]) -> Void, fail: @escaping (String) -> Void) {
        self.fetchApiData(route: APIRoutes.argentinaSportNewsRoute, success: { (data) in
            success(data)
        }) { (err) in
            fail(err)
        }
    }
    
    func fetchGermanySportNews(success: @escaping ([NewsVO]) -> Void, fail: @escaping (String) -> Void) {
        self.fetchApiData(route: APIRoutes.germanySportNewsRoute, success: { (data) in
            success(data)
        }) { (err) in
            fail(err)
        }
    }
    
    func fetchTopHeadlinesNews(success: @escaping ([NewsVO]) -> Void, fail: @escaping (String) -> Void) {
        self.fetchApiData(route: APIRoutes.topHeadlinesRoute, success: { (data) in
            success(data)
        }) { (err) in
            fail(err)
        }
    }
    
}
