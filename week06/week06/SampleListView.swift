//
//  SampleListView.swift
//  week06
//
//  Created by 조영서 on 5/17/25.
//

import SwiftUI

struct SampleListView: View {
    let chats: [ChatModel]

    var body: some View {
        VStack(spacing: 8) {
            // 상단 유저 정보
            HStack(spacing: 12) {
                Image("Image")
                    .resizable()
                    .frame(width: 65, height: 65)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                    .padding(5)

                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("홍길동")
                            .font(.subheadline)
                            .fontWeight(.semibold)

                        Text("서울")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }

                    Text("안녕하세요")
                        .font(.subheadline)
                }

                Spacer()

                Image("thumb4")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(5)
            }
            .padding(.horizontal)

            // 채팅 리스트
            List(chats) { chat in
                ChatRowView(chat: chat)
            }
            .listStyle(.plain)
        }
    }
}

struct ChatRowView: View {
    let chat: ChatModel

    var body: some View {
        HStack(spacing: 12) {
            Image(chat.profileImageName)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(chat.name)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text(chat.location)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

                Text(chat.message)
                    .font(.subheadline)
                    .lineLimit(1)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Image(chat.thumbnailImageName)
                .resizable()
                .frame(width: 45, height: 45)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    SampleListView(chats: chatDummy)
}
