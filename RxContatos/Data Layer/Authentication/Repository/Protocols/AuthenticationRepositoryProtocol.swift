//
//  AuthenticationRepositoryProtocol.swift
//  RxContatos
//
//  Created by Jobson Mateus on 24/08/20.
//  Copyright © 2020 jobson. All rights reserved.
//

import Foundation

protocol AuthenticationRepositoryProtocol {
    func login(email: String, password: String)
    func logout()
    func signup(user: User)
    func getUser() -> User
    func isSessionActive() -> Bool
    func getToken() -> String
}

