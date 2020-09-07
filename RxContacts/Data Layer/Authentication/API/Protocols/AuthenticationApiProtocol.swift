//
//  AuthenticationApiProtocol.swift
//  RxContacts
//
//  Created by Jobson Mateus on 26/08/20.
//  Copyright © 2020 Jobson Mateus. All rights reserved.
//

import Foundation
import Alamofire

protocol AuthenticationApiProtocol {
    
    func login(email: String, password: String) -> DataRequest
    func logout(token: String) -> DataRequest
    func signup(user: UserDTO) -> DataRequest
}
