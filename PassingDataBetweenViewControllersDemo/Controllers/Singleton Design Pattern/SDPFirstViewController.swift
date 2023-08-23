//
//  SDPViewController.swift
//  DemoForPassingDataBetweenViewControllers
//
//  Created by BrainX IOS on 15/08/2022.
//

import UIKit

class SDPFirstViewController: UIViewController, UIGestureRecognizerDelegate {

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
        UserProfile.instance.userName = textField.text ?? LocalizedKey.emptyText.string
        let viewController = SDPSecondViewController.instantiate(from: .main)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
