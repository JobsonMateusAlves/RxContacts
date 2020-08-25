//
//  AuthenticationRemoteRepository.swift
//  RxContatos
//
//  Created by Jobson Mateus on 24/08/20.
//  Copyright © 2020 jobson. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class AuthenticationRemoteRepository: AuthenticationRemoteRepositoryProtocol {
    
    var api: AuthenticationApi
    
    init(api: AuthenticationApi) {
        self.api = api
    }
    
    func login(email: String, password: String, result: @escaping (SessionModel?, Error?) -> Void) {
        
        self.api.login(email: email, password: password).validate().responseObject { (response: DataResponse<SessionModel>) in
            
            result(response.value, response.error)
        }
    }
    
    func logout(token: String, result: @escaping (Error?) -> Void) {
        
        self.api.logout(token: token).response { (response: DefaultDataResponse) in
            
            result(response.error)
        }
    }
    
    func signup(user: UserModel, result: @escaping (SessionModel?, Error?) -> Void) {
        
        self.api.signup(user: user).validate().responseObject { (response: DataResponse<SessionModel>) in
            
            result(response.value, response.error)
        }
    }
}
