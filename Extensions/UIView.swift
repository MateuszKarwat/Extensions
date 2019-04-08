import UIKit

extension UIView {
    func embedSubview(_ subview: UIView) {
        if subview.superview == self {
            return
        }

        if subview.superview != nil {
            subview.removeFromSuperview()
        }

        addSubview(subview)
        fill(with: subview)
    }

    func isContained(within other: UIView) -> Bool {
        var current: UIView? = self

        while let proposedView = current {
            if proposedView == other {
                return true
            }

            current = proposedView.superview
        }

        return false
    }

    func fill(with view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = bounds

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leftAnchor.constraint(equalTo: leftAnchor),
            view.rightAnchor.constraint(equalTo: rightAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension UIView {
    var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }

    var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }

    var borderColor: UIColor? {
        get { return layer.borderColor.flatMap(UIColor.init(cgColor:)) }
        set { layer.borderColor = newValue?.cgColor }
    }
}
