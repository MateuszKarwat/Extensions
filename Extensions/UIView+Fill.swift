import UIKit

extension UIView {
    func fill(with view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.active([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leftAnchor.constraint(equalTo: leftAnchor),
            view.rightAnchor.constraint(equalTo: rightAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
