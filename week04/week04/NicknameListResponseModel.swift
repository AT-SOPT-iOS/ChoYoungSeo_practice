//
//  NicknameListResponseModel.swift
//  week04
//
//  Created by 조영서 on 5/3/25.
//


import Foundation

struct NicknameResponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: NicknameListResponseModel
}

struct NicknameListResponseModel: Codable {
    let nicknameList: [String]
}
