//
//  DependenciesManager.swift
//  RxContacts
//
//  Created by Jobson Mateus on 26/08/20.
//  Copyright © 2020 Jobson Mateus. All rights reserved.
//

import Foundation
import RealmSwift

struct DependenciesManager {
    
    //MARK: DB
    let realm: Realm! = {
        return try? Realm()
    }()
    
    //MARK: User preferences
    let userDefaults: UserDefaults = {
        return UserDefaults()
    }()
    
    //MARK: Api
    let authenticationApi: AuthenticationApi = {
        return AuthenticationApi()
    }()
    
//    let authenticationApi: AuthenticationApi = {
//        return AuthenticationApi()
//    }()
}
