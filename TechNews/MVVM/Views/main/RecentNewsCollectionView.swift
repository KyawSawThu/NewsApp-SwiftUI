//
//  RecentNewsCollectionView.swift
//  TechNews
//
//  Created by Riki on 12/2/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import SwiftUI

struct RecentNewsCollectionView: View {
    
    var sportNews: [NewsVO]
    
    var body: some View {
        VStack(spacing: 4) {
            HStack {
                Text("Recent News")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                Text("See All")
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.blue)
            }
            .padding([.leading, .trailing, .bottom])
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top) {
                    ForEach(0...sportNews.count-1, id: \.self) { i in
                        RecentNewsCell(news: self.sportNews[i])
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

struct RecentNewsCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        RecentNewsCollectionView(sportNews: [NewsVO]())
    }
}
