import UIKit
import Foundation

extension UIView {
    
    // MARK: - Static Properties
    
    static var identifierForView: String {
        return String(describing: self)
    }
    
    // MARK: - Static Methods
    
    static func nibForView() -> UINib {
        return UINib(nibName: self.identifierForView, bundle: nil)
    }
    
    // MARK: - Internal Methods
    
    func setBorderColor(_ color: UIColor, andWidth width: CGFloat = 1.0) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
    
    func setCornerRadius(_ r : CGFloat, andClipContent clip: Bool = false) {
        layer.cornerRadius = r
        layer.masksToBounds = clip
    }
    
    func setCornerRadius(_ r: CGFloat, forCorners corners: CACornerMask, andClipContent clip: Bool = false) {
        layer.maskedCorners = corners
        setCornerRadius(r, andClipContent: clip)
    }
    
    func addShadow(color: UIColor = Color.shadowColor,
                   alpha: Float = 1,
                   x: CGFloat = 0,
                   y: CGFloat = 2,
                   radius: CGFloat = 2 ) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: x, height: y)
        layer.shadowOpacity = alpha
        layer.shadowRadius = radius
    }
    
    func addTapToDismissKeyboard() {
        addTapAction(#selector(dismissKeyboard))
    }
    
    func addTapAction(_ action: Selector, target: Any? = nil) {
        let tapGesture = UITapGestureRecognizer(target: target ?? self, action: action)
        tapGesture.cancelsTouchesInView = false
        addGestureRecognizer(tapGesture)
    }
    
    @discardableResult
    func loadFromNib<T: UIView>() -> T? {
        let bundle = Bundle(for: type(of: self))
        let loadedView = bundle.loadNibNamed(String(describing: type(of: self)),
                                             owner: self,
                                             options: nil)?.first
        guard let contentView = loadedView as? T else {
            return nil
        }
        return contentView
    }
    
    func fixInView(_ container: UIView) {
        frame = container.bounds
        container.addSubview(self)
        addEqualConstraintsWith(container)
    }
    
    func addEqualConstraintsWith(_ view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        [NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0),
         NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0),
         NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0),
         NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0)].forEach { $0.isActive = true }
    }
    
    // MARK: - Action Methods
    
    @objc
    func dismissKeyboard() {
        endEditing(true)
    }
}
