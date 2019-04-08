import UIKit

extension UIViewController {

    /// Embeds view controller in a container view.
    ///
    /// - Parameters:
    ///   - newChild: View controller to embed.
    ///   - container: View which is used as a container view for `newChild`'s view.
    ///                If not specified, view controller is embedded in this view controller's view.
    func embedChild(_ newChild: UIViewController, in container: UIView? = nil) {
        if let oldParent = newChild.parent, oldParent != self {
            newChild.beginAppearanceTransition(false, animated: false)
            newChild.willMove(toParent: nil)
            newChild.removeFromParent()

            if newChild.viewIfLoaded?.superview != nil {
                newChild.viewIfLoaded?.removeFromSuperview()
            }

            newChild.endAppearanceTransition()
        }

        let targetContainer: UIView
        if let container = container, container.isContained(within: view) {
            targetContainer = container
        } else {
            targetContainer = view
        }

        if newChild.parent != self {
            newChild.beginAppearanceTransition(true, animated: false)
            addChild(newChild)
            newChild.didMove(toParent: self)
            targetContainer.embedSubview(newChild.view)
            newChild.endAppearanceTransition()
        } else {
            // The view controller is already a child.
            // Make sure it's in the right view.

            // We don't do the appearance transition stuff here,
            // because the vc is already a child, so *presumably*
            // that transition stuff has already happened.
            targetContainer.embedSubview(newChild.view)
        }
    }
}
