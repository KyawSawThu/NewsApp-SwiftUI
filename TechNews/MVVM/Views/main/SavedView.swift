//
//  SavedView.swift
//  TechNews
//
//  Created by Riki on 12/2/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import SwiftUI

struct SavedView: View {
    
    var savedNews: [NewsVO]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                Text("Saved Articles")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                ForEach(0...savedNews.count-1, id: \.self) { i in
                    BreakingNewsCell(news: self.savedNews[i])
                }
            }
            .padding()
        }
    }
}

struct SavedView_Previews: PreviewProvider {
    static var previews: some View {
        SavedView(savedNews: [NewsVO]())
    }
}
