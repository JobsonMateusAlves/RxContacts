//
//  ScreenManager.swift
//  RxContacts
//
//  Created by Jobson Mateus on 26/08/20.
//  Copyright © 2020 Jobson Mateus. All rights reserved.
//

import Foundation
import UIKit

class ScreenManager {
    
    static func login() {
        UIApplication.shared.windows.first?.rootViewController = UINavigationController(rootViewController: ContactsViewController())
    }
    
    static func logout() {
//        UIApplication.shared.windows.first?.rootViewController = ViewController(nibName: "Main", bundle: nil)
    }
    
    static func setupInitialController(session: Bool) {
        
        if session {
            self.login()
        } else {
            self.logout()
        }
    }
}
