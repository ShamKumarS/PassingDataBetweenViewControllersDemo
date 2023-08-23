import UIKit

extension UIViewController {
    
    // MARK: - Static Properties
    
    static var storyboardId: String {
        String(describing: self)
    }
    
    // MARK: - Static Methods
    
    static func instantiate(from storyboardName: UIStoryboard.Name) -> Self {
        let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: storyboardId) as! Self
    }
}
