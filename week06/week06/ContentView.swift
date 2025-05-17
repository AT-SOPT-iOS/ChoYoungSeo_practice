//
//  ContentView.swift
//  week06
//
//  Created by 조영서 on 5/17/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .bottom){
            Image("serious_cat")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    Text("고냐니는 사실 흰색이 아닌\n밝은 회색 고양이에요")
                        .font(.headline)
                    Text("충격실화ㄷㄷㄷ")
                        .font(.subheadline)
                }
                Spacer()
            }
            .padding()
            .foregroundColor(.primary)
            .background(Color.primary
                .colorInvert()
                .opacity(0.75))
        }
    }
}

#Preview {
    ContentView()
}
