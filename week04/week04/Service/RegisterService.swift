//
//  RegisterService.swift
//  week04
//
//  Created by 조영서 on 5/3/25.
//

import Foundation

struct RegisterRequestBody: Codable {
    let loginId: String
    let password: String
    let nickname: String
}

struct RegisterResponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: RegisterResponseBody
}

struct RegisterResponseBody: Codable {
    let userId: Int
    let nickname: String
}

// MARK: - RegisterService

final class RegisterService {
    static let shared = RegisterService()
    private init() {}

    private func makeRequestBody(loginId: String, password: String, nickName: String) -> Data? {
        do {
            let body = RegisterRequestBody(loginId: loginId, password: password, nickname: nickName)
            return try JSONEncoder().encode(body)
        } catch {
            print("Request 인코딩 에러:", error)
            return nil
        }
    }

    private func makeRequest(body: Data?) -> URLRequest {
        let url = URL(string: "https://api.atsopt-seminar4.site/api/v1/auth/signup")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = body
        return request
    }

    func PostRegisterData(
        loginId: String,
        password: String,
        nickName: String
    ) async throws -> RegisterResponseBody {
        guard let body = makeRequestBody(loginId: loginId, password: password, nickName: nickName) else {
            throw NetworkError.requestEncodingError
        }

        let request = makeRequest(body: body)
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            throw configureHTTPError(errorCode: httpResponse.statusCode)
        }

        do {
            let decoded = try JSONDecoder().decode(RegisterResponseWrapper.self, from: data)
            return decoded.data
        } catch {
            print("디코딩 실패:", error)
            throw NetworkError.responseDecodingError
        }
    }

    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
    }
}
