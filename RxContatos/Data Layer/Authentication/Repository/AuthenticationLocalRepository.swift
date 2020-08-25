//
//  AuthenticationLocalRepository.swift
//  RxContatos
//
//  Created by Jobson Mateus on 24/08/20.
//  Copyright © 2020 jobson. All rights reserved.
//

import Foundation
import RealmSwift


class AuthenticationLocalRepository: LocalRepository<UserModel>, AuthenticationLocalRepositoryProtocol {
    
    private enum SessionKeys: String {
        case token
    }
    
    func create(session: SessionModel) {
        
        if let user = session.user {
            self.save(object: user, update: .error)
        }
        
        if let token = session.token {
            self.userDefaults.set(token, forKey: SessionKeys.token.rawValue)
        }
    }
    
    func logout() {
        
        self.delete()
        
        self.userDefaults.set("", forKey: SessionKeys.token.rawValue)
    }
    
    func getUser() -> UserModel? {
        
        return self.realm.objects(UserModel.self).first
    }
    
    func isSessionActive() -> Bool {
        
        guard let token = self.userDefaults.object(forKey: SessionKeys.token.rawValue) as? String, let _ = self.getUser(), !token.isEmpty else {
            
            self.logout()
            
            return false
        }

        return true
    }
    
    func getToken() -> String {
        
        return (self.userDefaults.object(forKey: SessionKeys.token.rawValue) as? String) ?? ""
    }
}
