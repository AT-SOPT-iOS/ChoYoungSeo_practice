//
//  CarrotView.swift
//  week06
//
//  Created by 조영서 on 5/17/25.
//

import SwiftUI

struct CarrotView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .bottomTrailing) {
                Image("dummy_1")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                Image("heart_deact")
                    .frame(width: 10, height: 10)
                    .padding(8)
            }
            HStack(spacing: 5) {
                Text("아이폰 13프로맥스")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text("군자 1동")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Text("1,000,000원")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.orange)
        }
        Spacer()
    }
}

#Preview {
    CarrotView()
}
