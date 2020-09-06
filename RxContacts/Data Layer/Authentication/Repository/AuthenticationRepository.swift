//
//  AuthenticationRepository.swift
//  RxContatos
//
//  Created by Jobson Mateus on 24/08/20.
//  Copyright © 2020 jobson. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

class AuthenticationRepository: AuthenticationRepositoryProtocol {
    
    //MARK: Properties
    private let localRepository: AuthenticationLocalRepositoryType
    private let remoteRepository: AuthenticationRemoteRepositoryProtocol
    
    //MARK: Inits
    init(localRepository: AuthenticationLocalRepositoryType, remoteRepository: AuthenticationRemoteRepositoryProtocol) {
        
        self.localRepository = localRepository
        self.remoteRepository = remoteRepository
    }
    
    //MARK: Action methods
    func login(email: String, password: String) {
        
        self.remoteRepository.login(email: email, password: password) { (model, error) in
            
            print(error?.localizedDescription ?? "")
            
            if let model = model {
                self.localRepository.create(session: model)
            }
        }
    }
    
    func logout() {
        self.remoteRepository.logout(token: self.getToken()) { (error) in
            print(error?.localizedDescription ?? "")
            
            if let _ = error {
                self.localRepository.logout()
            }
        }
    }
    
    func signup(user: User) {
        
//        self.remoteRepository.signup(user: UserModel(user: user)) { (model, error) in
//            
//            print(error?.localizedDescription ?? "")
//            
//            if let model = model {
//                self.localRepository.create(session: model)
//            }
//        }
    }
    
    //MARK: Result methods
    func getUser() -> Observable<User> {
        
        return self.localRepository.user.map { (userModel) -> User in
            
            return User(id: userModel?.id,
                        name: userModel?.name,
                        photo: userModel?.photo,
                        email: userModel?.email)
        }
    }
    
    func isSessionActive() -> Observable<Bool> {
        self.localRepository.isSessionActive
    }
    
    func getToken() -> String {
        self.localRepository.token
    }
}
