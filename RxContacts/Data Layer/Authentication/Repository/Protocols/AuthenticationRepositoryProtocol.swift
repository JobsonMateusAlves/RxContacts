//
//  AuthenticationRepositoryProtocol.swift
//  RxContatos
//
//  Created by Jobson Mateus on 24/08/20.
//  Copyright © 2020 jobson. All rights reserved.
//

import Foundation
import RxSwift
protocol AuthenticationRepositoryProtocol {
    //MARK: Action methods
    func login(email: String, password: String)
    func logout()
    func signup(user: UserDTO)
    
    //MARK: Result methods
    func getUser() -> Observable<User>
    func isSessionActive() -> Observable<Bool>
    func getToken() -> String
}

