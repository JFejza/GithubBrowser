

import UIKit

//Convenience init class for nibs, the only convention required is that the nib/storyboard ID be equal to the class name

//MARK: Storyboard identifiers
enum Storyboard: String {
    case Repos
}

protocol NibIdentifiable {
    static var nibIdentifier: String { get }
}

extension UIStoryboard {
    
    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.rawValue, bundle: bundle)
    }
    
    func instantiateViewController<T: NibIdentifiable>() -> T {
        let optionalViewController = self.instantiateViewController(withIdentifier: T.nibIdentifier)
        
        guard let viewController = optionalViewController as? T  else {
            fatalError("Couldn’t instantiate view controller with identifier \(T.nibIdentifier) ")
        }
        
        return viewController
    }
    
}

extension NibIdentifiable where Self: UIViewController {
    static var nibIdentifier: String {
        return String(describing: self)
    }
    
    static func from(storyboard: Storyboard) -> Self {
        let storyboard = UIStoryboard(storyboard: storyboard)
        return storyboard.instantiateViewController()
    }
}

extension UIViewController : NibIdentifiable { }

extension NibIdentifiable where Self: UIView {
    static var nibIdentifier: String {
        return String(describing: self)
    }
    
    static func fromNib() -> Self {
        let optionalNib = Bundle.main.loadNibNamed(Self.nibIdentifier, owner: nil, options: nil)
        
        guard let nib = optionalNib else {
            fatalError("Couldn’t instantiate nib with identifier \(Self.nibIdentifier) ")
        }
        
        return nib.first as! Self
    }
    
    
}

extension UIView: NibIdentifiable { }
