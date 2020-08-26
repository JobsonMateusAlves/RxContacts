//
//  AuthenticationApi.swift
//  RxContatos
//
//  Created by Jobson Mateus on 24/08/20.
//  Copyright © 2020 jobson. All rights reserved.
//

import Foundation
import Alamofire

class AuthenticationApi: AuthenticationApiProtocol {
    
    func login(email: String, password: String) -> DataRequest{
        
        let parameters: Parameters = ["email": email,
                                      "password": password]
        
        return AF.request("\(baseUrl)/login",
                          method: .post,
                          parameters: parameters,
                          encoding: JSONEncoding.default)
    }
    
    func logout(token: String) -> DataRequest {
        
        return AF.request("\(baseUrl)/logout", method: .delete, headers: ["token": token])
    }
    
    func signup(user: UserModel) -> DataRequest {
        
        return AF.request("\(baseUrl)/signup",
                          method: .delete,
                          parameters: user.toJSON(),
                          encoding: JSONEncoding.default)
    }
}
