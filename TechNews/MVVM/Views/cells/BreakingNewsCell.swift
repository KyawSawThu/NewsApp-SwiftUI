//
//  BreakingNewsCell.swift
//  TechNews
//
//  Created by Riki on 12/2/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import SwiftUI

struct BreakingNewsCell: View {
    
    @ObservedObject var imageFetcher : ImageFetcher
    
    private var NewsImage: AnyView {
        if let image = UIImage(data: imageFetcher.data) {
            return AnyView(
                Image(uiImage: image)
                    .resizable()
                    .renderingMode(.original)
                    .scaledToFill()
                    .frame(width: 140, height: 100)
                    .cornerRadius(5)
            )
        } else {
            return AnyView(
                Image("champion_placeholder")
                    .resizable()
                    .renderingMode(.original)
                    .scaledToFill()
                    .frame(width: 140, height: 100)
                    .cornerRadius(5)
            )
        }
        
    }
    
    let news: NewsVO
    
    init(news: NewsVO) {
        imageFetcher = ImageFetcher(urlString: news.urlToImage ?? "")
        self.news = news
    }
    
    private var newsDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = formatter.date(from: news.publishedAt ?? "")
        formatter.dateStyle = .medium
        return formatter.string(from: date ?? Date())
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading){
                    Text(news.author ?? "Anonymous")
                        .font(.system(size: 17))
                        .foregroundColor(.green)
                        .fontWeight(.medium)
                        .padding([.bottom], 4)
                    Text(news.source?.name ?? "")
                        .font(.system(size: 13))
                        .foregroundColor(.blue)
                        .fontWeight(.medium)
                        .padding([.bottom], 4)
                    Text(news.description ?? "")
                        .font(.headline)
                        .fontWeight(.bold)
                        .fixedSize(horizontal: false, vertical: true)
                }
                Spacer()
                NewsImage
            }
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray)
        }
        
    }
}

struct BreakingNewsCell_Previews: PreviewProvider {
    static var previews: some View {
        BreakingNewsCell(news: NewsVO())
    }
}
