//
//  BackGroundTypes.swift
//  RGB
//
//  Created by 박준하 on 2022/10/31.
//

import Foundation
import UIKit

enum BackGroundType {
    case Login
    case Password
    case PasswordCompletion
    case Signup
    case Certification
    
    func getNextController() -> UIViewController {
        switch self {
        case .Login:
            return LoginViewController()
        case .Password:
            return PasswordChangeVC()
        case .PasswordCompletion:
            return PasswordCompletionViewController()
        case .Signup:
            return SignupViewController()
        case .Certification:
            return CertificationViewController()
        }
    }
}
