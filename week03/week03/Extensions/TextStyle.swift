import UIKit

extension UIFont {
    
    static var head1: UIFont {
        return UIFont(name: "Pretendard-ExtraBold", size: 25) ?? UIFont.systemFont(ofSize: 25, weight: .heavy)
    }
    
    static var subhead1: UIFont {
        return UIFont(name: "Pretendard-Bold", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .bold)
    }
    
    static var subhead2: UIFont {
        return UIFont(name: "Pretendard-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    
    static var subhead3: UIFont {
        return UIFont(name: "Pretendard-Bold", size: 15) ?? UIFont.systemFont(ofSize: 15, weight: .bold)
    }
    
    static var subhead4: UIFont {
        return UIFont(name: "Pretendard-SemiBold", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .semibold)
    }
    
    static var subhead5: UIFont {
        return UIFont(name: "Pretendard-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    static var info12: UIFont {
        return UIFont(name: "Pretendard-Regular", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .regular)
    }
}
