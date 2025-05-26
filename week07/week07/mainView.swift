//
//  mainView.swift
//  week07
//
//  Created by 조영서 on 5/24/25.
//

import SwiftUI

struct mainView: View {
    @State private var isSheetPresented = false

    var body: some View {
        VStack(spacing: 20) {
            Text("메인 화면")
                .font(.largeTitle)

            Button("시트 열기") {
                isSheetPresented = true
            }
        }
        .sheet(isPresented: $isSheetPresented) {
            SheetView(isPresented: $isSheetPresented)
        }
    }
}

struct SheetView: View {
    @Binding var isPresented: Bool

    var body: some View {
        VStack {
            Text("시트 화면")
                .font(.title)

            Button("닫기") {
                isPresented = false
            }
        }
    }
}

#Preview {
    mainView()
}
