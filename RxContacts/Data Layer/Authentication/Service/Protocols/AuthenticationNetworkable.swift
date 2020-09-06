//
//  AuthenticationNetworkable.swift
//  RxContacts
//
//  Created by Jobson Mateus on 06/09/20.
//  Copyright © 2020 Jobson Mateus. All rights reserved.
//

import Foundation
import Moya
import RxSwift

protocol AuthenticationNetworkable {
    
    var provider: MoyaProvider<AuthenticationApi> { get }
    
    func login(
        email: String,
        password: String,
        disposeBag: DisposeBag,
        completion: @escaping ((SessionDTO?, Error?) -> Void)
    )
    
    func signup(user: UserDTO,
                disposeBag: DisposeBag,
                completion: @escaping ((SessionDTO?, Error?) -> Void)
    )
    
    func logout(token: String,
                disposeBag: DisposeBag,
                completion: @escaping ((Error?) -> Void)
    )
    
    func deleteUsers(id: String,
                     disposeBag: DisposeBag,
                     completion: @escaping ((Error?) -> Void)
    )
}
