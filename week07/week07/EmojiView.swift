//
//  EmojiView.swift
//  week07
//
//  Created by 조영서 on 5/24/25.
//

import SwiftUI

struct EmojiView: View {
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0x1f600...0x1f64F, id: \.self) { value in
                    VStack {
                        //Text(String(format: "%X", value))
                            //.font(.caption)
                        Text(emoji(value))
                            .font(.largeTitle)
                    }
                    .padding()
                }
            }
            .padding()
        }
    }

    private func emoji(_ value: Int) -> String {
        guard let scalar = UnicodeScalar(value) else { return "?" }
        return String(Character(scalar))
    }
}

#Preview {
    EmojiView()
}
