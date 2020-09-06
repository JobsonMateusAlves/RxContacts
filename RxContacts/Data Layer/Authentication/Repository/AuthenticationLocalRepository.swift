//
//  AuthenticationLocalRepository.swift
//  RxContatos
//
//  Created by Jobson Mateus on 24/08/20.
//  Copyright © 2020 jobson. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift
import RxRelay

class AuthenticationLocalRepository: AuthenticationLocalRepositoryType {
    
    //MARK: Enum
    private enum SessionKeys: String {
        case token
    }
    //MARK: Observable properties

    private var userValue = BehavoirRelay<UserModel?>(defaultValue: nil)
    var user: Observable<UserModel?> {
        get {
            self.userValue.asObservable()
        }
    }
    
    private var active = BehavoirRelay<Bool>(defaultValue: false)
    var isSessionActive: Observable<Bool> {
        get {
            self.active.asObservable()
        }
    }
    //MARK: Properties
    var token: String {
        get {
            return (self.userDefaults.object(forKey: SessionKeys.token.rawValue) as? String) ?? ""
        }
    }
    
    override init(realm: Realm, userDefaults: UserDefaults) {
        super.init(realm: realm, userDefaults: userDefaults)
        
        self.setUser()
    }
    
    //MARK: Action methods
    func create(session: SessionDTO) {
        
        if let user = session.user {
            self.delete()
//            self.save(object: user, update: .error)
        }
        
        if let token = session.token {
            self.set(token)
        }
        
        self.setUser()
    }
    
    func logout() {
        
        self.delete()
        
        self.set("")
        self.setUser()
    }
    
    private func setUser() {
        
        self.userValue.accept(self.realm.objects(UserModel.self).first)
        
        self.active.accept(self.realm.objects(UserModel.self).first != nil && !self.token.isEmpty)
    }
    
    private func set(_ token: String) {
        self.userDefaults.set(token, forKey: SessionKeys.token.rawValue)
    }
}
