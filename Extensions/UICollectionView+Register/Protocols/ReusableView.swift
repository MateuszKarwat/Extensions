import UIKit

protocol ReusableView: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableView { }
extension UICollectionViewCell: ReusableView { }
