import UIKit

import SnapKit
import Then

final class InfoViewController: UIViewController {

    // MARK: - Properties

    private var keyword: String = ""
    private let userId: Int = 1 

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setLayout()
    }

    // MARK: - Actions
    
     @objc private func searchButtonTap() {
        Task {
            do {
                let nicknameList = try await UserService.shared.fetchNicknameList(
                    keyword: self.keyword.isEmpty ? nil : self.keyword
                )

                let nicknameTexts = nicknameList.map { "\($0)" }.joined(separator: "\n")
                self.infoLabel.text = "닉네임 리스트:\n\(nicknameTexts)"

            } catch {
                self.infoLabel.text = "조회 실패: \(error.localizedDescription)"
            }
        }
    }


    
    @objc private func textFieldDidEditing(_ textField: UITextField) {
        self.keyword = textField.text ?? ""
    }

    // MARK: - Layout

    private func setLayout() {
        self.view.addSubview(stackView)

        stackView.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(40)
            $0.top.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(200)
        }

        [keywordTextField, infoLabel, searchButton].forEach {
            self.stackView.addArrangedSubview($0)
        }
    }

    // MARK: - UI Components

    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.spacing = 20
    }

    private lazy var keywordTextField = UITextField().then {
        $0.addTarget(self, action: #selector(textFieldDidEditing(_:)), for: .editingChanged)
        $0.backgroundColor = UIColor(named: "Gray2")
        $0.placeholder = "검색할 닉네임을 입력하세요"
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.setLeftPadding(12)
        $0.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }

    private lazy var searchButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(searchButtonTap),
                     for: .touchUpInside)
        $0.backgroundColor = UIColor(named: "YoungPink")
        $0.setTitle("검색하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }

    private lazy var infoLabel = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 16)
    }
}
