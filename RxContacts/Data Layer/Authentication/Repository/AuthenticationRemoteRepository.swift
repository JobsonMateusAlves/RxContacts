//
//  AuthenticationRemoteRepository.swift
//  RxContatos
//
//  Created by Jobson Mateus on 24/08/20.
//  Copyright © 2020 jobson. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class AuthenticationRemoteRepository: AuthenticationRemoteRepositoryProtocol {
    
    //MARK: Properties
    private var api: AuthenticationNetworkable
    private var disposeBag: DisposeBag
    
    //MARK: Inits
    init(api: AuthenticationNetworkable, disposeBag: DisposeBag) {
        self.api = api
        self.disposeBag = disposeBag
    }
    
    //MARK: Methods
    func login(email: String, password: String, result: @escaping (SessionDTO?, Error?) -> Void) {
        
        self.api.login(email: email, password: password, disposeBag: self.disposeBag) { (session, error) in
            
            result(session, error)
        }

    }
    
    func logout(token: String, result: @escaping (Error?) -> Void) {
        
        self.api.logout(token: token, disposeBag: self.disposeBag) { (error) in
            
            result(error)
        }
    }
    
    func signup(user: UserDTO, result: @escaping (SessionDTO?, Error?) -> Void) {
        
        self.api.signup(user: user, disposeBag: self.disposeBag) { (session, error) in
            
            result(session, error)
        }
    }
    
    func delete(id: String, result: @escaping (Error?) -> Void) {
        
        self.api.deleteUsers(id: id, disposeBag: self.disposeBag) { (error) in
            
            result(error)
        }
    }
}
