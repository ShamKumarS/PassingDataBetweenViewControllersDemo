//
//  SecondViewController.swift
//  DemoForPassingDataBetweenViewControllers
//
//  Created by BrainX IOS on 11/08/2022.
//

import Foundation
import UIKit

class SeguesSecondViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var greetingLabel: UILabel!
    
    // MARK: - Internal Properties
    
    var greetings = ""

    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        greetingLabel.text = greetings
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
}
