//
//  AppDelegate.swift
//  RxContacts
//
//  Created by Jobson Mateus on 26/08/20.
//  Copyright © 2020 Jobson Mateus. All rights reserved.
//

import UIKit
import RealmSwift
import Swinject

var realm: Realm!
let baseUrl = "http://contatosapi.herokuapp.com/api"
var headers: [String: String] = [:]

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
//    let container: Container = {
//        let container = Container()
//        
//        container.register(Realm.self, factory: { _ in try! Realm() })
//        container.register(UserDefaults.self, factory: { _ in UserDefaults() })
//        
//        container.register(AuthenticationApiProtocol.self) { _ in AuthenticationApi() }
//        
//        container.register(AuthenticationRemoteRepositoryProtocol.self, factory: { r in
//            AuthenticationRemoteRepository(api: r.resolve(AuthenticationApiProtocol.self)!)
//        })
//        container.register(AuthenticationLocalRepositoryType.self, factory: { r in
//            AuthenticationLocalRepository(realm: r.resolve(Realm.self)!, userDefaults: r.resolve(UserDefaults.self)!)
//        })
//        container.register(AuthenticationRepositoryProtocol.self, factory: { r in
//            AuthenticationRepository(
//                localRepository: r.resolve(AuthenticationLocalRepositoryType.self)!,
//                remoteRepository: r.resolve(AuthenticationRemoteRepositoryProtocol.self)!
//            )
//        })
//        
//        return container
//    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        realm = try? Realm()
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}

