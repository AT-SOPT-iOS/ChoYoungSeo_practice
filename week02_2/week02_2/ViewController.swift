import UIKit

class ViewController: UIViewController {
    
    static var boxWidth = UIScreen.main.bounds.width / 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
    }
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let redView = UIView()
    private let orangeView = UIView()
    private let yellowView = UIView()
    private let greenView = UIView()
    private let blueView = UIView()
    private let purpleView = UIView()
    
    
    private func setLayout() {
        
        redView.backgroundColor = .red
        orangeView.backgroundColor = .orange
        yellowView.backgroundColor = .yellow
        greenView.backgroundColor = .green
        blueView.backgroundColor = .blue
        purpleView.backgroundColor = .purple
        
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        redView.translatesAutoresizingMaskIntoConstraints = false
        orangeView.translatesAutoresizingMaskIntoConstraints = false
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        greenView.translatesAutoresizingMaskIntoConstraints = false
        blueView.translatesAutoresizingMaskIntoConstraints = false
        purpleView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(redView)
        contentView.addSubview(orangeView)
        contentView.addSubview(yellowView)
        contentView.addSubview(greenView)
        contentView.addSubview(blueView)
        contentView.addSubview(purpleView)
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
        ])
        
        
        let heightConstraint = contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor)
        heightConstraint.priority = .defaultLow
        heightConstraint.isActive = true
        
        
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: contentView.topAnchor),
            redView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            redView.widthAnchor.constraint(equalToConstant: ViewController.boxWidth),
            redView.heightAnchor.constraint(equalToConstant: 350)
        ])

        NSLayoutConstraint.activate([
            orangeView.topAnchor.constraint(equalTo: contentView.topAnchor),
            orangeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            orangeView.widthAnchor.constraint(equalToConstant: ViewController.boxWidth),
            orangeView.heightAnchor.constraint(equalToConstant: 350)
        ])

        NSLayoutConstraint.activate([
            yellowView.topAnchor.constraint(equalTo: redView.bottomAnchor),
            yellowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            yellowView.widthAnchor.constraint(equalToConstant: ViewController.boxWidth),
            yellowView.heightAnchor.constraint(equalToConstant: 350)
        ])

        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(equalTo: orangeView.bottomAnchor),
            greenView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            greenView.widthAnchor.constraint(equalToConstant: ViewController.boxWidth),
            greenView.heightAnchor.constraint(equalToConstant: 350)
        ])

        NSLayoutConstraint.activate([
            blueView.topAnchor.constraint(equalTo: yellowView.bottomAnchor),
            blueView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            blueView.widthAnchor.constraint(equalToConstant: ViewController.boxWidth),
            blueView.heightAnchor.constraint(equalToConstant: 350)
        ])

        NSLayoutConstraint.activate([
            purpleView.topAnchor.constraint(equalTo: greenView.bottomAnchor),
            purpleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            purpleView.widthAnchor.constraint(equalToConstant: ViewController.boxWidth),
            purpleView.heightAnchor.constraint(equalToConstant: 350),
            purpleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
