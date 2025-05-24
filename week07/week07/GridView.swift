//
//  GridView.swift
//  week07
//
//  Created by 조영서 on 5/24/25.
//

import SwiftUI

struct GridView: View {
    
    let rows = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 16) {
                ForEach(1...20, id: \.self) { index in
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.orange)
                                .frame(width: 80 ,height: 80)
                            
                            Text("\(index)")
                                .font(.headline)
                                .foregroundColor(.white)
                    }
                }
            }
            .padding()

        }
        .background(Color.white)
    }
}

#Preview {
    GridView()
}
