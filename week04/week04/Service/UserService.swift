//
//  UserService.swift
//  week04
//
//  Created by 조영서 on 5/8/25.
//

import Foundation


struct NicknameChangeRequest: Codable {
    let nickname: String
}

struct NicknameResponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: NicknameListResponseModel
}

struct NicknameListResponseModel: Codable {
    let nicknameList: [String]
}

// MARK: - UserService

final class UserService {
    static let shared = UserService()
    private init() {}

    // MARK: - 닉네임 수정 (PATCH)
    func patchNickname(userId: Int, nickname: String) async throws {
        guard let url = URL(string: "https://api.atsopt-seminar4.site/api/v1/users") else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("\(userId)", forHTTPHeaderField: "userId")

        let body = NicknameChangeRequest(nickname: nickname)
        request.httpBody = try JSONEncoder().encode(body)

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            let serverMessage = String(data: data, encoding: .utf8) ?? "알 수 없는 오류"
            throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: serverMessage])
        }
    }

    // MARK: - 닉네임 리스트 조회 (GET)
    func fetchNicknameList(keyword: String?) async throws -> [String] {
        var urlString = "https://api.atsopt-seminar4.site/api/v1/users"

        if let keyword = keyword, !keyword.isEmpty,
           let encoded = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            urlString += "?keyword=\(encoded)"
        }

        guard let url = URL(string: urlString) else {
            throw NetworkError.requestEncodingError
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.responseError
        }

        do {
            let decoded = try JSONDecoder().decode(NicknameResponseWrapper.self, from: data)
            return decoded.data.nicknameList
        } catch {
            print("디코딩 실패:", error)
            throw NetworkError.responseDecodingError
        }
    }
}
