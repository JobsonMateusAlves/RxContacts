//
//  AuthenticationLocalRepositoryProtocol.swift
//  RxContatos
//
//  Created by Jobson Mateus on 24/08/20.
//  Copyright © 2020 jobson. All rights reserved.
//

import Foundation
import RxSwift

protocol AuthenticationLocalRepositoryProtocol {
    var token: String { get }
    var user: Observable<UserModel?> { get }
    var isSessionActive: Observable<Bool> { get }
    
    func create(session: SessionDTO)
    func logout()
}
