//
//  LoginViewController.swift
//  week01
//
//  Created by 조영서 on 4/11/25.
//

import UIKit

class LoginViewController: UIViewController {
        
    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 68, y: 163, width: 250, height: 44))
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = UIColor(named: "Black")
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .subhead1
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 276, width: 335, height: 52))
        textField.layer.cornerRadius = 6
        textField.placeholder = "아이디"
        textField.font = .subhead4
        textField.backgroundColor = UIColor(named: "Grey200")?.withAlphaComponent(1.0)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        textField.leftViewMode = .always
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width: 335, height: 52))
        textField.layer.cornerRadius = 6
        textField.placeholder = "비밀번호"
        textField.font = .subhead4
        textField.backgroundColor = UIColor(named: "Grey200")?.withAlphaComponent(1.0)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 422, width: 335, height: 57))
        button.backgroundColor = UIColor(named: "Primary_orange")
        button.layer.cornerRadius = 6
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(UIColor(named: "White"), for: .normal)
        button.titleLabel?.font = .subhead1
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
    }
        
    @objc
    private func loginButtonDidTap() {
        pushToWelcomeVC()
    }
    
    
    private func setLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach {
            self.view.addSubview($0)
        }
    }
    
    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.modalPresentationStyle = .formSheet
        welcomeViewController.id = idTextField.text
        self.present(welcomeViewController, animated: true)
    }

    private func pushToWelcomeVC() {
        guard let idText = idTextField.text, !idText.isEmpty else {
            showAlert(message: "아이디를 입력해주세요.")
            return
        }
        guard let passwordText = passwordTextField.text, !passwordText.isEmpty else {
            showAlert(message: "비밀번호를 입력해주세요.")
            return
        }
        
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.id = idText
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    private func showAlert(message: String) {
        let alertController = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}
