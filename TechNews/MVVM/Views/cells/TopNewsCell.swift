//
//  TopNewsCell.swift
//  TechNews
//
//  Created by Riki on 12/2/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import SwiftUI

struct TopNewsCell: View {
    
    @ObservedObject var imageFetcher : ImageFetcher
    
    private var NewsImage: AnyView {
        if let image = UIImage(data: imageFetcher.data) {
            return AnyView(
                Image(uiImage: image)
                    .resizable()
                    .renderingMode(.original)
                    .scaledToFill()
                    .frame(width: 350, height: 220)
                    .animation(.spring())
                    .cornerRadius(12)
                    .padding([.leading])
            )
        } else {
            return AnyView(
                Image("champion_placeholder")
                    .resizable()
                    .renderingMode(.original)
                    .scaledToFill()
                    .frame(width: 350, height: 220)
                    .animation(.spring())
                    .cornerRadius(12)
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
        VStack(alignment: .leading, spacing: 6) {
            NewsImage
            Text(news.source?.name ?? "")
                .font(.headline)
                .fontWeight(.medium)
                .foregroundColor(.blue)
                .padding([.leading, .top])
            Text(news.title ?? "")
                .font(.system(size: 23))
                .fontWeight(.bold)
                .lineLimit(3)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.leading)
                .padding([.leading, .trailing])
        }.frame(width: 370)
    }
}

struct TopNewsCell_Previews: PreviewProvider {
    static var previews: some View {
        TopNewsCell(news: NewsVO())
    }
}




//VStack(alignment: .leading, spacing: 6) {
//    Image("wwdc2019")
//        .resizable()
//        .scaledToFill()
//        .frame(width: 350, height: 220)
//        .cornerRadius(12)
//        .padding([.leading])
//    Text("Apple Inc.")
//        .font(.headline)
//        .fontWeight(.medium)
//        .foregroundColor(.blue)
//        .padding([.leading, .top])
//    Text("Since 1987, Apple WWDC has been one of the most popular developer conferences.")
//        .font(.system(size: 23))
//        .fontWeight(.bold)
//        .lineLimit(3)
//        .fixedSize(horizontal: false, vertical: true)
//        .multilineTextAlignment(.leading)
//        .padding([.leading, .trailing])
//}.frame(width: 370)

//"Since 1987, Apple WWDC has been one of the most popular developer conferences."
