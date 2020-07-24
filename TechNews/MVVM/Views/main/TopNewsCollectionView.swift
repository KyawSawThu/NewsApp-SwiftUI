//
//  TopNewsCollectionView.swift
//  TechNews
//
//  Created by Riki on 12/2/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import SwiftUI

struct TopNewsCollectionView: View {
    
    var topNews: [NewsVO]
    
    private var date: String {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter.string(from: currentDate)
        
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            
            Text("SPORTS NEWS")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(.red)
                .padding([.leading, .trailing, .top])
            
            Text(date)
                .font(.system(size: 17))
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .padding([.leading, .trailing])
            
            HStack {
                Text("Top News")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                Image("champion_league_logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50).cornerRadius(25)
            }
            .padding([.leading, .trailing, .bottom])
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: -4) {
                    ForEach(0...topNews.count-1, id: \.self) { i in
                        TopNewsCell(news: self.topNews[i])
                    }
                }
            }
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray)
                .padding()
        }
    }
}

struct TopNewsCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        TopNewsCollectionView(topNews: [NewsVO]())
    }
}
