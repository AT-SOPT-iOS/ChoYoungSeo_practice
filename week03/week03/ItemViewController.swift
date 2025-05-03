//
//  ItemViewController.swift
//  week03
//
//  Created by 조영서 on 4/26/25.
//

import UIKit
import SnapKit

final class ItemViewController: UIViewController, UICollectionViewDelegate {
    
    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    private let itemList = ItemModel.dummy()
    
    private let cellHeight: CGFloat = 200
    private let carrotLineSpacing: CGFloat = 12
    private let carrotInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        setLayout()
        setCollectionViewLayout()
        register()
    }
    
    private let placeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        return label
    }()
    
    /*
    let expandButton: UIButton = {
        let button = UIButton
        button.setImage(.expand_arrow, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button
    }()
    
    private lazy var titleStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [placeLabel,expandButton])
        stack.axis = .horizontal
        stack.spacing = 33
        stack.alignment = .center
        return stack
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton
        button.setImage(.ic_search, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button
    }()
    
    let hamburgerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(.menu, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button
    }()
    
    let alertButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(.ic_alarm, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button
    }()
    
    private lazy var menuStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [searchButton,hamburgerButton,alertButton])
        stack.axis = .horizontal
        stack.spacing = 33
        stack.alignment = .center
        return stack
    }()
     
    */
    
    private func setLayout() {
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    private func register() {
        collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
    }
    
    private func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        
        let screenWidth = UIScreen.main.bounds.width
        let interItemSpacing = carrotLineSpacing
        let availableWidth = screenWidth - carrotInset.left - carrotInset.right - interItemSpacing
        let itemWidth = availableWidth / 2
        
        flowLayout.itemSize = CGSize(width: itemWidth, height: cellHeight)
        flowLayout.minimumLineSpacing = carrotLineSpacing
        flowLayout.minimumInteritemSpacing = interItemSpacing
        flowLayout.sectionInset = carrotInset
        
        collectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    private func calculateCollectionViewHeight() -> CGFloat {
        let count = CGFloat(itemList.count)
        let heightCount = count / 2 + count.truncatingRemainder(dividingBy: 2)
        return heightCount * cellHeight + (heightCount - 1) * carrotLineSpacing + carrotInset.top + carrotInset.bottom
    }
}

extension ItemViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ItemCollectionViewCell.identifier,
            for: indexPath
        ) as? ItemCollectionViewCell else { return UICollectionViewCell() }
        
        cell.dataBind(itemList[indexPath.row], index: indexPath.row)
        return cell
    }
}
