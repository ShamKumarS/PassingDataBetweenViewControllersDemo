//
//  ViewController.swift
//  DemoForPassingDataBetweenViewControllers
//
//  Created by BrainX IOS on 11/08/2022.
//

import UIKit

class SeguesFirstViewController: UIViewController, UIGestureRecognizerDelegate {

    // MARK: - Outlets
    
    @IBOutlet weak var textField: UITextField!
    
    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nickName = textField.text ?? LocalizedKey.emptyText.string
        if let destinationViewController  = segue.destination as? SeguesSecondViewController {
            destinationViewController.greetings = "\(LocalizedKey.helloDear.string) \(nickName)!"
        }
    }
}
