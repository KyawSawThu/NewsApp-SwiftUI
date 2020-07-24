//
//  BreakingNewsCollectionView.swift
//  TechNews
//
//  Created by Riki on 12/2/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import SwiftUI

struct BreakingNewsCollectionView: View {
    
    var breakingNews: [NewsVO]
    
    var body: some View {
        VStack(spacing: 4) {
            HStack {
                Text("Breaking News")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                Text("See All")
                    .font(.body)
                    .fontWeight(.medium).foregroundColor(.blue)
            }
            .padding([.bottom])
            
            VStack(alignment: .leading) {
                ForEach(0...breakingNews.count-1, id: \.self) { i in
                    BreakingNewsCell(news: self.breakingNews[i])
                }
            }
            
        }
        .padding([.leading, .trailing])
    }
}

struct BreakingNewsCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        BreakingNewsCollectionView(breakingNews: [NewsVO]())
    }
}
