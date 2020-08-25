//
//  AuthenticationRemoteRepository.swift
//  RxContatos
//
//  Created by Jobson Mateus on 24/08/20.
//  Copyright © 2020 jobson. All rights reserved.
//

import Foundation

protocol AuthenticationRemoteRepositoryProtocol {
    func login(email: String, password: String, result: @escaping (SessionModel?, Error?) -> Void)
    func logout(token: String, result: @escaping (Error?) -> Void)
    func signup(user: UserModel, result: @escaping (SessionModel?, Error?) -> Void)
}
