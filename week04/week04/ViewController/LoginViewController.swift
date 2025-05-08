//
//  LoginViewController.swift
//  week04
//
//  Created by 조영서 on 5/8/25.
//

import UIKit
import SnapKit
import Then

final class LoginViewController: UIViewController {
    
    private var loginId: String = ""
    private var password: String = ""
    private var nickName: String = ""
    private var loggedInUserId: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }

    @objc private func loginButtonTap() {
        Task {
            do {
                let response = try await AuthService.shared.postSignIn(
                    loginId: self.loginId,
                    password: self.password
                )
                
                self.loggedInUserId = response.userId

                let alert = UIAlertController(
                    title: "로그인 성공",
                    message: "환영합니다! (ID: \(response.userId))",
                    preferredStyle: .alert
                )
                alert.addAction(UIAlertAction(title: "확인", style: .default))
                self.present(alert, animated: true)
            } catch {
                let alert = UIAlertController(
                    title: "로그인 실패",
                    message: error.localizedDescription,
                    preferredStyle: .alert
                )
                alert.addAction(UIAlertAction(title: "확인", style: .default))
                self.present(alert, animated: true)
                print("로그인 에러:", error)
            }
        }
    }

    @objc private func goToChangeNameButtonTap() {
        let changeNameVC = ChangeNameViewController()
        changeNameVC.userId = self.loggedInUserId
        self.present(changeNameVC, animated: true)
    }

    @objc private func textFieldDidEditing(_ textField: UITextField) {
        switch textField {
        case idTextField:
            loginId = textField.text ?? ""
        case passwordTextField:
            password = textField.text ?? ""
        default:
            break
        }
    }

    private func setLayout() {
        self.view.backgroundColor = .white
        self.view.addSubview(stackView)

        stackView.snp.makeConstraints {
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide).inset(200)
        }

        [idTextField, passwordTextField, loginButton, goToChangeNameButton].forEach {
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

    private lazy var idTextField = UITextField().then {
        $0.addTarget(self, action: #selector(textFieldDidEditing(_:)), for: .allEvents)
        $0.backgroundColor = UIColor(named: "Gray2")
        $0.placeholder = "아이디를 입력하세요"
        $0.layer.cornerRadius = 10
        $0.setLeftPadding(12)
        $0.clipsToBounds = true
    }

    private lazy var passwordTextField = UITextField().then {
        $0.addTarget(self, action: #selector(textFieldDidEditing(_:)), for: .allEvents)
        $0.backgroundColor = UIColor(named: "Gray2")
        $0.placeholder = "패스워드를 입력하세요"
        $0.setLeftPadding(12)
        $0.isSecureTextEntry = true
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }

    private lazy var loginButton = UIButton().then {
        $0.addTarget(self, action: #selector(loginButtonTap), for: .touchUpInside)
        $0.backgroundColor = UIColor(named: "YoungPink")
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }

    private lazy var goToChangeNameButton = UIButton().then {
        $0.addTarget(self, action: #selector(goToChangeNameButtonTap), for: .touchUpInside)
        $0.backgroundColor = UIColor(named: "YoungPink")
        $0.setTitle("닉네임 수정", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }
}


#Preview {
    LoginViewController()
}
