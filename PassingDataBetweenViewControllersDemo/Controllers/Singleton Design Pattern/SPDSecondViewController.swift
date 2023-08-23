//
//  SPDSecondViewController.swift
//  DemoForPassingDataBetweenViewControllers
//
//  Created by BrainX IOS on 15/08/2022.
//

import UIKit

class SDPSecondViewController: UIViewController, UIGestureRecognizerDelegate {

    // MARK: - Outlets
    
    @IBOutlet weak var greetingsLabel: UILabel!
    
    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        greetingsLabel.text = "Hello Dear \(UserProfile.instance.userName)!"
    }
}
