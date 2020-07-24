//
//  GenresCell.swift
//  TechNews
//
//  Created by Riki on 12/2/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import SwiftUI

struct GenresCell: View {
    var genre: Genre
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image(genre.image)
                    .resizable()
                    .frame(width: 20, height: 20)
                Text(genre.title)
                    .font(.system(size: 17))
                    .fontWeight(.regular)
                Spacer()
                Image(systemName: "location.fill")
                    .resizable()
                    .frame(width: 14, height: 14)
                    
            }
            .foregroundColor(.blue)
            .padding()
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray)
        }
        
    }
}

struct GenresCell_Previews: PreviewProvider {
    static var previews: some View {
        GenresCell(genre: Genre(image: "", title: ""))
    }
}
