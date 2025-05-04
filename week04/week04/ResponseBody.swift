//
//  ResponseBody.swift
//  week04
//
//  Created by 조영서 on 5/3/25.
//

// MARK: - ResponseBody.swift

import UIKit

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


