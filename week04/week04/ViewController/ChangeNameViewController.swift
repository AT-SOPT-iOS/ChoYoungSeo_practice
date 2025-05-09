//
//  ChangeNameViewController.swift
//  week04
//
//  Created by 조영서 on 5/8/25.
//

import UIKit
import SnapKit
import Then
import SwiftUI

final class ChangeNameViewController: UIViewController {

    var userId: Int = 0  

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }

    @objc private func backToHomeButtonTap() {
        let registerVC = RegisterViewController()
        self.present(registerVC, animated: true)
    }

    @objc private func newnickNameButtonTap() {
        guard let nickname = newnickNameTextField.text, !nickname.isEmpty else {
            showAlert(title: "입력 오류", message: "닉네임을 입력해주세요.")
            return
        }

        Task {
            do {
                try await UserService.shared.patchNickname(userId: userId, nickname: nickname)
                showAlert(title: "닉네임 수정 완료", message: "닉네임이 성공적으로 변경되었습니다.")
            } catch {
                showAlert(title: "닉네임 수정 실패", message: error.localizedDescription)
                print("닉네임 수정 에러:", error)
            }
        }
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        self.present(alert, animated: true)
    }

    private func setLayout() {
        self.view.backgroundColor = .white
        self.view.addSubview(stackView)

        stackView.snp.makeConstraints {
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide).inset(200)
        }

        [idLabel, newnickNameTextField, newnickNameButton, backToHomeButton].forEach {
            stackView.addArrangedSubview($0)
            $0.snp.makeConstraints {
                $0.height.equalTo(44)
            }
        }
    }

    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.spacing = 20
    }

    private lazy var idLabel = UILabel().then {
        $0.text = "닉네임을 변경하세요"
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 16, weight: .medium)
        $0.layer.cornerRadius = 14
        $0.clipsToBounds = true
    }

    private lazy var newnickNameTextField = UITextField().then {
        $0.backgroundColor = UIColor(named: "Gray2")
        $0.placeholder = "새 닉네임을 입력하세요"
        $0.textAlignment = .center
        $0.layer.cornerRadius = 10
        $0.setLeftPadding(12)
        $0.clipsToBounds = true
    }

    private lazy var newnickNameButton = UIButton().then {
        $0.addTarget(self, action: #selector(newnickNameButtonTap), for: .touchUpInside)
        $0.backgroundColor = UIColor(named: "YoungPink")
        $0.setTitle("닉네임 수정", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }

    private lazy var backToHomeButton = UIButton().then {
        $0.addTarget(self, action: #selector(backToHomeButtonTap), for: .touchUpInside)
        $0.backgroundColor = UIColor(named: "YoungPink")
        $0.setTitle("홈으로 돌아가기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }
}

#Preview {
    ChangeNameViewController()
}
