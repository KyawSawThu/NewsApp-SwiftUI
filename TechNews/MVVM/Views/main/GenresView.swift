//
//  GenresView.swift
//  TechNews
//
//  Created by Riki on 12/2/19.
//  Copyright © 2019 KyawSawThu. All rights reserved.
//

import SwiftUI

struct GenresView: View {
    var data: [Genre]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Genres")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            
            ForEach(0...data.count-1, id:\.self){ i in
                GenresCell(genre: self.data[i])
            }
        }.padding()
    }
}

struct GenresView_Previews: PreviewProvider {
    static var previews: some View {
        GenresView(data: [Genre]())
    }
}
