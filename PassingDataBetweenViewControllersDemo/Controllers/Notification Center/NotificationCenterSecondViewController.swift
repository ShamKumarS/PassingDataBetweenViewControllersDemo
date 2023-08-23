//
//  NotificationCenterSecondViewController.swift
//  DemoForPassingDataBetweenViewControllers
//
//  Created by BrainX IOS on 16/08/2022.
//

import UIKit

class NotificationCenterSecondViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var greetingLabel: UILabel!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(self.greetUser(_:)), name: .userNameNotification, object: nil)
    }
    
    // MARK: - Action Methods
    
    @IBAction
    func didPressEnterName(_ sender: Any) {
        let viewController = NotificationCenterFirstViewController.instantiate(from: .main)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc
    func greetUser(_ notification: NSNotification) {
        guard let userName = notification.userInfo?["name"] else { return }
        greetingLabel.text = "\(LocalizedKey.helloDear.string) \(String(describing: userName))!"
    }
}
