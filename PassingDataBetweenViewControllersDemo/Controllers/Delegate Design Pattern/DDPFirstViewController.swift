//
//  SecondViewController.swift
//  DemoForPassingDataBetweenViewControllers
//
//  Created by BrainX IOS on 11/08/2022.
//

import Foundation
import UIKit

// MARK: - JuiceDelegate Protocol

protocol JuiceDelegate: AnyObject {
    
    func flavorWasChosen(_ flavor: String)
}

class DDPFirstViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var juiceFlavorLabel: UILabel!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    // MARK: - Action Methods
    
    @IBAction
    func didPressOrderJuiceButton(_ sender: Any) {
        let viewController = DDPSecondViewController.instantiate(from: .main)
        viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - JuiceDelegate Confirmation and Implementation

extension DDPFirstViewController: JuiceDelegate {

    func flavorWasChosen(_ flavor: String) {
        juiceFlavorLabel.text = "Here is your " + flavor + " juice!"
    }
}
