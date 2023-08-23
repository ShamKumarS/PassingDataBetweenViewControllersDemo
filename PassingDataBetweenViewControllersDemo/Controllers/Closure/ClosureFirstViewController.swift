//
//  ClosureFirstViewController.swift
//  DemoForPassingDataBetweenViewControllers
//
//  Created by BrainX IOS on 15/08/2022.
//

import Foundation
import UIKit

class ClosureFirstViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var favouriteFruitLabel: UILabel!
    
    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    // MARK: - Action Methods

    @IBAction
    func didPressChooseFavoriteFruit(_ sender: Any) {
        let viewController = ClosureSecondViewController.instantiate(from: .main)
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
    
    @IBAction
    func didPressBackArrow(_ sender: Any) {
        dismiss(animated: true)
    }
    
    // MARK: - Internal Methods
    
    func setPet(_ pet: String) {
        favouriteFruitLabel.text = "Here is your favorite fruit \(pet)."
    }
}
