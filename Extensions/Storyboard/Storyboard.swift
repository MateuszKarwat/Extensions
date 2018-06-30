import UIKit

enum Storyboard: String {
    case Main

    func instantiate<T: StoryboardIdentifiable>(_ type: T.Type, inBundle bundle: Bundle = .main) -> T {
        guard let viewController = UIStoryboard(name: self.rawValue, bundle: bundle)
            .instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
                fatalError("Couldn't instantiate \(T.storyboardIdentifier) from \(self.rawValue)")
        }

        return viewController
    }
}
