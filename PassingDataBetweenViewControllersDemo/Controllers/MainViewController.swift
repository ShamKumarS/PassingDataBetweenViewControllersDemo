//
//  MainViewController.swift
//  DemoForPassingDataBetweenViewControllers
//
//  Created by BrainX IOS on 11/08/2022.
//

enum Ways: String {
    case segues = "Segues"
    case delegateDesignPattern = "Delegate Design Pattern"
    case singletonDesignPattern = "Singleton Design Pattern"
    case closures = "Closures"
    case notificationCenter = "Notification Center"
}

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Private Properties
    
    private let titlesArray = [Ways.segues.rawValue,
                               Ways.delegateDesignPattern.rawValue,
                               Ways.singletonDesignPattern.rawValue,
                               Ways.closures.rawValue,
                               Ways.notificationCenter.rawValue]
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.reuseIdentifier)
    }
}

// MARK: - MainViewController Methods

extension MainViewController {
    
    // MARK: - Private Methods
    
    func goToTappedController(_ enumCase: Ways) {
        var viewController: UIViewController!
        switch enumCase {
            case .segues:
                viewController = SeguesFirstViewController.instantiate(from: .main)
            case .delegateDesignPattern:
                viewController = DDPFirstViewController.instantiate(from: .main)
            case .singletonDesignPattern:
                viewController = SDPFirstViewController.instantiate(from: .main)
            case .closures:
                viewController = ClosureFirstViewController.instantiate(from: .main)
                viewController.modalPresentationStyle = .fullScreen
                present(viewController, animated: true, completion: nil)
                return
            case .notificationCenter:
                viewController = NotificationCenterSecondViewController.instantiate(from: .main)
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - UITableViewDataSource Methods

extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return titlesArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueCell(for: indexPath)
        cell.textLabel?.text = titlesArray[indexPath.section]
        cell.textLabel?.textColor = .brown
        cell.setCornerRadius(10)
        cell.addShadow(color: Color.shadowColor, alpha: 1.0, x: 0, y: 4, radius: 16)
        cell.selectionStyle = .none
        cell.backgroundColor = .lightGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let enumCase = Ways(rawValue: titlesArray[indexPath.section]) else { return }
        goToTappedController(enumCase)
    }
}

// MARK: - UITableViewDelegate Methods

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
}
