//
//  ItemModel.swift
//  week03
//
//  Created by 조영서 on 4/26/25.
//

import UIKit

struct ItemModel {
    let itemImg: UIImage
    let name: String
    let price: String
    var heartIsSelected: Bool
}

extension ItemModel {
    static func dummy() -> [ItemModel] {
        return [
            ItemModel(itemImg: .item1, name: "퉁퉁퉁사후르", price: "5000", heartIsSelected: false),
            ItemModel(itemImg: .item2, name: "오쏘몰", price: "5000", heartIsSelected: false),
            ItemModel(itemImg: .item3, name: "애플워치", price: "5000", heartIsSelected: true),
            ItemModel(itemImg: .item4, name: "가방", price: "5000", heartIsSelected: true),
            ItemModel(itemImg: .item5, name: "헤드셋", price: "5000", heartIsSelected: true),
            ItemModel(itemImg: .item1, name: "틴트", price: "5000", heartIsSelected: false),
            ItemModel(itemImg: .item2, name: "카메라", price: "5000", heartIsSelected: false),
            ItemModel(itemImg: .item3, name: "로션", price: "5000", heartIsSelected: false),
            ItemModel(itemImg: .item4, name: "락스", price: "5000", heartIsSelected: false),
            ItemModel(itemImg: .item5, name: "가방", price: "5000", heartIsSelected: false),
            ItemModel(itemImg: .item1, name: "헤드셋", price: "5000", heartIsSelected: false),
            ItemModel(itemImg: .item2, name: "틴트", price: "5000", heartIsSelected: false)
        ]
    }
}
