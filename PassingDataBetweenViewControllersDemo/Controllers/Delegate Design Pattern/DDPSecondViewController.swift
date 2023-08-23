//
//  SecondViewController.swift
//  DemoForPassingDataBetweenViewControllers
//
//  Created by BrainX IOS on 11/08/2022.
//

import Foundation
import UIKit

class DDPSecondViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var greetingLabel: UILabel!
    
    // MARK: - Internal Properties
    
    weak var delegate: JuiceDelegate?
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Action Methods
    
    @IBAction
    func didPressFlavorButton(_ sender: UIButton) {
        let flavor = sender.titleLabel?.text ?? "flavor"
        delegate?.flavorWasChosen(flavor)
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}
