

import UIKit

protocol ReuseIdentifiable {
    static var dynamicReuseIdentifier: String { get }
}

extension ReuseIdentifiable {
    static var dynamicReuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell : ReuseIdentifiable { }
extension UICollectionViewCell : ReuseIdentifiable { }

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>() -> T where T: ReuseIdentifiable {
        
        let optionalCell = self.dequeueReusableCell(withIdentifier: T.dynamicReuseIdentifier)
        
        guard let cell = optionalCell as? T  else {
            fatalError("Couldn’t dequeue cell with identifier \(T.dynamicReuseIdentifier) ")
        }
        
        return cell
    }
}

extension UICollectionView {
    
    func dequeueReusableCellAtIndexPath<T: UICollectionViewCell>(indexPath: IndexPath) -> T where T: ReuseIdentifiable {
        
        let optionalCell = self.dequeueReusableCell(withReuseIdentifier: T.dynamicReuseIdentifier, for: indexPath)
        
        guard let cell = optionalCell as? T  else {
            fatalError("Couldn’t dequeue cell with identifier \(T.dynamicReuseIdentifier) ")
        }
        
        return cell
    }
}
