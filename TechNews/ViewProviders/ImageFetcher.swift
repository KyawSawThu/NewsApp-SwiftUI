//
//  ImageFetcher.swift
//  TechNews
//
//  Created by Riki on 12/12/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ImageFetcher: ObservableObject {

    var didChange = PassthroughSubject<Data, Never>()

    @Published var data: Data = Data() {
        didSet {
            didChange.send(data)
        }
    }

    init(urlString: String) {
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }

            if error != nil {
                print(error?.localizedDescription ?? "ErrorUnWrap")
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                let statusCode = httpResponse.statusCode
                if statusCode == 200 {
                    DispatchQueue.main.async { [weak self] in
                        self?.data = data
                    }
                } else {
                    print("Network Error :- \(statusCode)")
                }
            }
        }.resume()
    }
    

}
