//
//  HomeViewModel.swift
//  TechNews
//
//  Created by Riki on 12/6/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var isLoadingObs: Bool = false
    @Published var errObs: String? = nil
    
    @Published var topHeadlinesNews: [NewsVO] = [NewsVO]()
    @Published var germanySportNews: [NewsVO] = [NewsVO]()
    @Published var argentinaSportNews: [NewsVO] = [NewsVO]()

    let apiService = SharedRemoteModel.shared()
    
    init(){
        fetchNews()
    }
    
    fileprivate func fetchNews() {
        self.isLoadingObs = true
        apiService.fetchTopHeadlinesNews(success: { (topHeadlinesNews) in
            DispatchQueue.main.async {
                self.topHeadlinesNews = topHeadlinesNews
                self.apiService.fetchGermanySportNews(success: { (germanySportNews) in
                    DispatchQueue.main.async {
                        self.germanySportNews = germanySportNews
                    }
                    self.apiService.fetchArgentinaSportNews(success: { (argentinaSportNews) in
                        DispatchQueue.main.async {
                            self.argentinaSportNews = argentinaSportNews
                            self.isLoadingObs = false
                        }
                    }) { (err) in
                        DispatchQueue.main.async {
                            self.errObs = err
                            self.isLoadingObs = false
                        }
                    }
                }) { (err) in
                    DispatchQueue.main.async {
                        self.errObs = err
                        self.isLoadingObs = false
                    }
                }
            }
        }) { (err) in
            DispatchQueue.main.async {
                self.errObs = err
                self.isLoadingObs = false
            }
        }
    }
    
    fileprivate func processInBackgroundThread( data: Any, done: @escaping(Any)-> Void) {
        DispatchQueue.main.async { [data] in
            done(data)
        }
    }

    
}


