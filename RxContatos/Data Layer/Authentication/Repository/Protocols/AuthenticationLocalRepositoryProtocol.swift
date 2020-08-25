//
//  AuthenticationLocalRepositoryProtocol.swift
//  RxContatos
//
//  Created by Jobson Mateus on 24/08/20.
//  Copyright © 2020 jobson. All rights reserved.
//

import Foundation

protocol AuthenticationLocalRepositoryProtocol {
    func create(session: SessionModel)
    func logout()
    func getUser() -> UserModel?
    func isSessionActive() -> Bool
    func getToken() -> String
}
