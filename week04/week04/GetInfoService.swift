//
//  GetInfoService.swift
//  week04
//
//  Created by 조영서 on 5/3/25.
//

import Foundation

final class GetInfoService {
    static let shared = GetInfoService()
    private init() {}
    
    func makeRequest(keyword: String?) -> URLRequest? {
        var urlString = "https://api.atsopt-seminar4.site/api/v1/users"
        
        if let keyword = keyword, !keyword.isEmpty,
           let encoded = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            urlString += "?keyword=\(encoded)"
        }
        
        guard let url = URL(string: urlString) else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // optional
        return request
    }
    
    
    // 비동기적으로 실행 (즉, 이 함수는 잠시 멈췄다가 나중에 결과를 반환할 수 있는 함수)
    func fetchNicknameList(keyword: String?) async throws -> [String] {
        guard let request = makeRequest(keyword: keyword) else {
            throw NetworkError.requestEncodingError
        }
        
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
