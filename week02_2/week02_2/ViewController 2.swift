import UIKit

class ViewController2: UIViewController {
    
    static var boxWidth = UIScreen.main.bounds.width / 2
    static var boxHeight = UIScreen.main.bounds.height / 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
    }
    
    private func setLayout() {
        [yellowBox, greenBox, blackBox, blueBox].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate        ([
            yellowBox.topAnchor.constraint(equalTo: view.topAnchor),
            yellowBox.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            yellowBox.widthAnchor.constraint(equalToConstant: ViewController2.boxWidth),
            yellowBox.heightAnchor.constraint(equalToConstant: ViewController2.boxHeight)
        ])
        
        NSLayoutConstraint.activate        ([
            greenBox.topAnchor.constraint(equalTo: yellowBox.bottomAnchor),
            greenBox.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            greenBox.widthAnchor.constraint(equalToConstant: ViewController2.boxWidth),
            greenBox.heightAnchor.constraint(equalToConstant: ViewController2.boxHeight)
        ])
        
        NSLayoutConstraint.activate        ([
            blackBox.topAnchor.constraint(equalTo: greenBox.bottomAnchor),
            blackBox.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blackBox.widthAnchor.constraint(equalToConstant: ViewController2.boxWidth),
            blackBox.heightAnchor.constraint(equalToConstant: ViewController2.boxHeight)
        ])
        
        NSLayoutConstraint.activate        ([
            blueBox.topAnchor.constraint(equalTo: blackBox.bottomAnchor),
            blueBox.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blueBox.widthAnchor.constraint(equalToConstant: ViewController2.boxWidth),
            blueBox.heightAnchor.constraint(equalToConstant: ViewController2.boxHeight)
        ])
    }
    
    
    var yellowBox: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    var greenBox: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    var blueBox: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    
    var blackBox: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
}
