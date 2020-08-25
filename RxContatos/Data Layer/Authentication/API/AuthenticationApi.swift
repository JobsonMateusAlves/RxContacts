//
//  AuthenticationApi.swift
//  RxContatos
//
//  Created by Jobson Mateus on 24/08/20.
//  Copyright © 2020 jobson. All rights reserved.
//

import Foundation
import Alamofire

class AuthenticationApi {
    
    func login(email: String, password: String) -> DataRequest{
        
        let parameters: Parameters = ["email": email,
                                      "password": password]
        
        return Alamofire.request("\(baseUrl)/login",
                                 method: .post,
                                 parameters: parameters,
                                 encoding: JSONEncoding.default)
    }
    
    func logout(token: String) -> DataRequest {
        
        return Alamofire.request("\(baseUrl)/logout", method: .delete, headers: ["token": token])
    }
    
    func signup(user: UserModel) -> DataRequest {
        
        return Alamofire.request("\(baseUrl)/signup",
                                 method: .delete,
                                 parameters: user.toJSON(),
                                 encoding: JSONEncoding.default)
    }
}
