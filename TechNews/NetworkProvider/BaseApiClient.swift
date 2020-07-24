//
//  BaseApiClient.swift
//  TechNews
//
//  Created by Riki on 12/6/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import Foundation

class BaseApiClient {
    func fetchApiData(
        route: String,
        success: @escaping([NewsVO])->Void,
        fail: @escaping(String)->Void
    ){
        guard let url = URL(string: route) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else { return }
    
            if let httpResponse = response as? HTTPURLResponse {
                let statusCode = httpResponse.statusCode
                if statusCode == 200 {
                    do {
                        let decoder = JSONDecoder()
                        let news = try decoder.decode(NewsResponse.self, from: data)
                        success(news.articles ?? [NewsVO]())
                    } catch (let jsonErr) {
                        fail(jsonErr.localizedDescription)
                    }
                } else {
                    fail("Network Error:- \(statusCode)")
                }
            }
        
        }.resume()
    }
}
