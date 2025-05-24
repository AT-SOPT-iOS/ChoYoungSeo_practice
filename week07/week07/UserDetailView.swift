//
//  UserDetailView.swift
//  week07
//
//  Created by 조영서 on 5/24/25.
//

import SwiftUI

struct User: Identifiable {
    let id = UUID()
    let name: String
    let age: Int
}

struct UserListView: View {
    let users = [
        User(name: "마에다 리쿠", age: 23),
        User(name: "조영서", age: 23),
        User(name: "이도현", age: 31)
    ]
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink(destination: UserDetailView(user: user)) {
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                        VStack(alignment: .leading) {
                            Text(user.name)
                            Text("나이: \(user.age)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("사용자 목록")
        }
    }
}

struct UserDetailView: View {
    let user: User

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .resizable()
                .frame(width: 140, height: 120)
                .foregroundColor(.green)

            Text(user.name)
                .font(.title)
                .bold()

            Text("나이: \(user.age)세")
                .font(.title2)

            Spacer()
        }
        .padding()
        .navigationTitle("상세 정보")
    }
}

#Preview {
    UserListView()
}
