//
//  RegisterViewController.swift
//  week04
//
//  Created by 조영서 on 5/3/25.
//

import UIKit
import SnapKit
import Then

final class RegisterViewController: UIViewController {

    private var loginId: String = ""
    private var password: String = ""
    private var nickName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }

    @objc private func goToLoginButtonTap() {
        let loginVC = LoginViewController()
        self.present(loginVC, animated: true)
    }

    @objc private func infoViewButtonTap() {
        let infoVC = InfoViewController()
        self.present(infoVC, animated: true)
    }

    @objc private func registerButtonTap() {
        Task {
            do {
                let response = try await RegisterService.shared.PostRegisterData(
                    loginId: self.loginId,
                    password: self.password,
                    nickName: self.nickName
                )

                let alert = UIAlertController(
                    title: "계정 생성 성공",
                    message: "환영합니다, \(response.nickname)님! (ID: \(response.userId))",
                    preferredStyle: .alert
                )

                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
            } catch {
                let alert = UIAlertController(
                    title: "계정 생성 실패",
                    message: error.localizedDescription,
                    preferredStyle: .alert
                )

                let okAction = UIAlertAction(title: "확인", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)

                print("회원가입 에러:", error)
            }
        }
    }

    @objc private func textFieldDidEditing(_ textField: UITextField) {
        switch textField {
        case idTextField:
            loginId = textField.text ?? ""
        case passwordTextField:
            password = textField.text ?? ""
        case nickNameTextField:
            nickName = textField.text ?? ""
        default:
            break
        }
    }

    private func setLayout() {
        self.view.backgroundColor = .white
        self.view.addSubview(stackView)

        stackView.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(40)
            $0.top.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(160)
        }

        [idTextField, passwordTextField, nickNameTextField, loginButton,registerButton, infoViewButton].forEach {
            self.stackView.addArrangedSubview($0)
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
        $0.addTarget(self,
                     action: #selector(textFieldDidEditing(_:)),
                     for: .editingChanged)
        $0.backgroundColor = UIColor(named: "Gray2")
        $0.placeholder = "아이디를 입력하세요"
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }

    private lazy var passwordTextField = UITextField().then {
        $0.addTarget(self,
                     action: #selector(textFieldDidEditing(_:)),
                     for: .editingChanged)
        $0.backgroundColor = UIColor(named: "Gray2")
        $0.placeholder = "패스워드를 입력하세요"
        $0.textColor = .black
        $0.isSecureTextEntry = true
        $0.clearsOnBeginEditing = false
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.textContentType = .oneTimeCode
    }

    private lazy var nickNameTextField = UITextField().then {
        $0.addTarget(self,
                     action: #selector(textFieldDidEditing(_:)),
                     for: .editingChanged)
        $0.backgroundColor = UIColor(named: "Gray2")
        $0.placeholder = "닉네임을 입력하세요"
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }

    private lazy var loginButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(goToLoginButtonTap),
                     for: .touchUpInside)
        $0.backgroundColor = UIColor(named: "YoungPink")
        $0.setTitle("로그인하러 가기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }

    
    private lazy var registerButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(registerButtonTap),
                     for: .touchUpInside)
        $0.backgroundColor = UIColor(named: "YoungPink")
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }

    private lazy var infoViewButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(infoViewButtonTap),
                     for: .touchUpInside)
        $0.backgroundColor = UIColor(named: "YoungPink")
        $0.setTitle("회원정보 조회", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }
}

#Preview {
    RegisterViewController()
}

