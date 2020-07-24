//
//  HomeView.swift
//  TechNews
//
//  Created by Riki on 12/2/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    var news: [[NewsVO]]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading ,spacing: 4){
                TopNewsCollectionView(topNews: news[0])
                RecentNewsCollectionView(sportNews: news[1])
                BreakingNewsCollectionView(breakingNews: news[2])
                GenresView(data: Genre.fetchData())
            }
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(news: [[NewsVO]]())
    }
}
