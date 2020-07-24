//
//  RecentNewsCell.swift
//  TechNews
//
//  Created by Riki on 12/2/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import SwiftUI

struct RecentNewsCell: View {
    
    @ObservedObject var imageFetcher : ImageFetcher
    
    private var NewsImage: AnyView {
        if let image = UIImage(data: imageFetcher.data) {
            return AnyView(
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 160, height: 100)
                    .cornerRadius(5)
                    .padding([.leading])
            )
        } else {
            return AnyView(
                Image("champion_placeholder")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 160, height: 100)
                    .cornerRadius(5)
                    .padding([.leading])
            )
        }
        
    }
    
    let news: NewsVO
    
    init(news: NewsVO) {
        imageFetcher = ImageFetcher(urlString: news.urlToImage ?? "")
        self.news = news
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            NewsImage
            Text(news.author ?? "Anonymous")
                .font(.subheadline)
                .fontWeight(.regular)
                .foregroundColor(.green)
                .padding([.leading])
                .padding([.top], 4)
            Text(news.title ?? "")
                .font(.headline)
                .fontWeight(.bold)
                .lineLimit(3)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.leading)
                .padding([.leading, .trailing])
        }
        .frame(width: 170)
    }
}

struct RecentNewsCell_Previews: PreviewProvider {
    static var previews: some View {
        RecentNewsCell(news: NewsVO())
    }
}
