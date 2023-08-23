//
//  ClosureSecondViewController.swift
//  DemoForPassingDataBetweenViewControllers
//
//  Created by BrainX IOS on 15/08/2022.
//

import UIKit

class ClosureSecondViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    // MARK: - Action Methods

    @IBAction
    func didSelectFavoriteFruit(_ sender: UIButton) {
        let favoriteFruit = sender.titleLabel?.text ?? LocalizedKey.favoriteFruit.string
        if let viewController = presentingViewController as? ClosureFirstViewController {
            dismiss(animated: true, completion: {
                viewController.setPet(favoriteFruit)
            })
        }
        
//        if let vc = self.presentingViewController?.children.last as? ClosureFirstViewController {
//        // do stuff here
//            print(vc)
//        }
//        print(self.presentingViewController?.children.last)
//        if var topController = UIApplication.sharedApplication().keyWindow?.rootViewController {
//            while let presentedViewController = topController.presentedViewController {
//                topController = presentedViewController
//            }
//            print(topController)
//            // topController should now be your topmost view controller
//        }
    }
}


extension UINavigationController {
    var previousViewController: UIViewController? {
       viewControllers.count > 1 ? viewControllers[viewControllers.count - 2] : nil
    }
}
