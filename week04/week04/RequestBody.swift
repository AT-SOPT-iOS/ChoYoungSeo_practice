//
//  RequestBody.swift
//  week04
//
//  Created by 조영서 on 5/3/25.
//

// MARK: - RequestBody.swift

import UIKit

struct RegisterRequestBody: Codable {
    let loginId: String
    let password: String
    let nickname: String
}
