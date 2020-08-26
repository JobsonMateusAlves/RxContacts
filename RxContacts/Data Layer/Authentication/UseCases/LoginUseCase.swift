//
//  LoginUseCase.swift
//  RxContatos
//
//  Created by Jobson Mateus on 25/08/20.
//  Copyright © 2020 jobson. All rights reserved.
//

import Foundation
import RxSwift

class LoginUseCase: UseCase {
    
    typealias GenericParameterType = (email: String, password: String)
    typealias GenericResultType = Bool
    
    private var repository: AuthenticationRepositoryProtocol
    
    init(repository: AuthenticationRepositoryProtocol) {
        
        self.repository = repository
    }
    
    func execute(params: (email: String, password: String)) {
        self.repository.login(email: params.email, password: params.password)
    }
    
    func result() -> Observable<Bool> {

        return self.repository.isSessionActive()
    }
}
