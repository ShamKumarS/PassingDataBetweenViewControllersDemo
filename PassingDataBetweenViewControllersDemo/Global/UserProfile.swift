//
//  UserProfile.swift
//  DemoForPassingDataBetweenViewControllers
//
//  Created by BrainX IOS on 15/08/2022.
//

import Foundation

class UserProfile {
    
    // MARK: - Properties

    var userName = ""
    
    // MARK: - Self Instance

    static let instance = UserProfile()
    
    // MARK: - Initializers

    private init() { }
}
