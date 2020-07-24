//
//  IndexView.swift
//  TechNews
//
//  Created by Riki on 12/2/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import SwiftUI

struct IndexView: View {
    
    @ObservedObject var mViewModel: HomeViewModel = HomeViewModel()
    
    init() {
        UITabBar.appearance().backgroundColor = .gray
    }
    
    @State var selected = 0
    
    private var tab: some View {
        TabView(selection: $selected){
            
            HomeView(news: [mViewModel.germanySportNews, mViewModel.argentinaSportNews, mViewModel.topHeadlinesNews])
                .tabItem {
                    Image(systemName: AppConstants.TabBarImageName.tabBar01)
                    Text(AppConstants.TabBarText.tabBar01)
            }.tag(0)
            
//            NewsDetailView()
//                .tabItem {
//                    Image(systemName: AppConstants.TabBarImageName.tabBar02)
//                    Text(AppConstants.TabBarText.tabBar02)
//
//            }.tag(1)
            
            SavedView(savedNews: mViewModel.topHeadlinesNews)
                .tabItem {
                    Image(systemName: AppConstants.TabBarImageName.tabBar03)
                    Text(AppConstants.TabBarText.tabBar03)
                
            }.tag(1)
        }.accentColor(.red)
    }
    
    private var tabView: AnyView {
        if mViewModel.errObs != nil{
            return AnyView(
                Text(mViewModel.errObs ?? "").fontWeight(.medium)
            )
        }
        
        if !mViewModel.isLoadingObs {
            return AnyView(tab)
        } else {
            return AnyView(ActivityIndicator(style: .large))
        }
    }
    
    var body: some View {
        tabView
    }
}

struct IndexView_Previews: PreviewProvider {
    static var previews: some View {
        IndexView()
    }
}
