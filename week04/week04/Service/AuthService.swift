//
//  AuthService.swift
//  week04
//
//  Created by 조영서 on 5/8/25.
//

import Foundation

struct SignInRequest: Codable {
    let loginId: String
    let password: String
}

struct SignInResponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: SignInResponse
}

struct SignInResponse: Codable {
    let userId: Int
}

// MARK: - AuthService

final class AuthService {
    static let shared = AuthService()
    private init() {}

    func postSignIn(loginId: String, password: String) async throws -> SignInResponse {
        guard let url = URL(string: "https://api.atsopt-seminar4.site/api/v1/auth/signin") else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body = SignInRequest(loginId: loginId, password: password)
        request.httpBody = try JSONEncoder().encode(body)

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            let serverMessage = String(data: data, encoding: .utf8) ?? "알 수 없는 오류"
            print("❗로그인 실패 응답:", serverMessage)
            throw NSError(domain: "", code: httpResponse.statusCode, userInfo: [
                NSLocalizedDescriptionKey: serverMessage
            ])
        }

        let decoded = try JSONDecoder().decode(SignInResponseWrapper.self, from: data)
        return decoded.data
    }
}
