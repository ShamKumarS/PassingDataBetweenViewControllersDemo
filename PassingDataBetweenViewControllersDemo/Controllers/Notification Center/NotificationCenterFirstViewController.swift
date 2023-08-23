//
//  NotificationCenterFirstViewController.swift
//  DemoForPassingDataBetweenViewControllers
//
//  Created by BrainX IOS on 16/08/2022.
//

import UIKit

class NotificationCenterFirstViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var textField: UITextField!
    
    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }

    // MARK: - Action Methods

    @IBAction
    func submitTapped(_ sender: Any) {
        let userName = textField.text ?? LocalizedKey.emptyText.string
        let userDataDic = ["name": userName]
        NotificationCenter.default.post(name: .userNameNotification, object: nil, userInfo: userDataDic)
        navigationController?.popViewController(animated: true)
    }
}
