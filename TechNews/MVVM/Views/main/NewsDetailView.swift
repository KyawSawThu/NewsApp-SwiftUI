//
//  NewsDetailView.swift
//  TechNews
//
//  Created by Riki on 12/2/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import SwiftUI

struct NewsDetailView: View {
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    ZStack(alignment: .bottom){
                        Image("wwdc2019")
                            .resizable().frame(width: proxy.size.width, height: proxy.size.height / 3)
                        HStack{
                            Image("speech")
                                .resizable()
                                .frame(width: 100, height: 80)
                                .cornerRadius(5)
                            Spacer()
                        }.padding([.leading, .bottom], 8)
                    }
                    
                    Text("Apple's Worldwide Developers Conference (WWDC) 2019")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    HStack(alignment: .top) {
                        Spacer()
                        VStack(alignment: .trailing){
                            Text("Apple Inc.")
                                .font(.headline)
                                .fontWeight(.medium)
                                .foregroundColor(.blue)
                            Text("June3, 2019.")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundColor(.green)
                        }
                    }
                    .padding([.leading, .trailing])
                    
                    Text("WWDC")
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        .underline()
                        .padding([.leading, .trailing, .top])
                    
                    Text(AppConstants.WWDC)
                        .font(.headline)
                        .fontWeight(.light)
                        .padding([.leading, .trailing])
                }
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView()
    }
}
