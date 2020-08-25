//
//  AuthenticationRepository.swift
//  RxContatos
//
//  Created by Jobson Mateus on 24/08/20.
//  Copyright © 2020 jobson. All rights reserved.
//

import Foundation

class AuthenticationRepository: AuthenticationRepositoryProtocol {
    
    var localRepository: AuthenticationLocalRepository
    var remoteRepository: AuthenticationRemoteRepository
    
    init(localRepository: AuthenticationLocalRepository, remoteRepository: AuthenticationRemoteRepository) {
        
        self.localRepository = localRepository
        self.remoteRepository = remoteRepository
    }
    
    func login(email: String, password: String) {
        
        self.remoteRepository.login(email: email, password: password) { (model, error) in
            
            print(error?.localizedDescription ?? "")
            
            if let model = model {
                self.localRepository.create(session: model)
            }
        }
    }
    
    func logout() {
        self.remoteRepository.logout(token: self.localRepository.getToken()) { (error) in
            print(error?.localizedDescription ?? "")
            
            if let _ = error {
                self.localRepository.logout()
            }
        }
    }
    
    func signup(user: User) {
        
        self.remoteRepository.signup(user: UserModel(user: user)) { (model, error) in
            
            print(error?.localizedDescription ?? "")
            
            if let model = model {
                self.localRepository.create(session: model)
            }
        }
    }
    
    func getUser() -> User {
        
        let userModel = self.localRepository.getUser()
            
        return User(id: userModel?.id,
                    name: userModel?.name,
                    photo: userModel?.photo,
                    email: userModel?.email)
    }
    
    func isSessionActive() -> Bool {
        self.localRepository.isSessionActive()
    }
    
    func getToken() -> String {
        self.localRepository.getToken()
    }
}
