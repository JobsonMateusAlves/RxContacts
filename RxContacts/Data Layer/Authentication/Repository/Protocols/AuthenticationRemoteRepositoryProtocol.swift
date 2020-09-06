//
//  AuthenticationRemoteRepository.swift
//  RxContatos
//
//  Created by Jobson Mateus on 24/08/20.
//  Copyright © 2020 jobson. All rights reserved.
//

import Foundation

protocol AuthenticationRemoteRepositoryProtocol {
    func login(email: String, password: String, result: @escaping (SessionDTO?, Error?) -> Void)
    func logout(token: String, result: @escaping (Error?) -> Void)
    func signup(user: UserDTO, result: @escaping (SessionDTO?, Error?) -> Void)
    func delete(id: String, result: @escaping (Error?) -> Void)
}
