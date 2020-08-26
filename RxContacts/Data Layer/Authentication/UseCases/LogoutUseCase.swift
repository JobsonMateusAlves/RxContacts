//
//  LogoutUseCase.swift
//  RxContatos
//
//  Created by Jobson Mateus on 25/08/20.
//  Copyright © 2020 jobson. All rights reserved.
//

import Foundation
import RxSwift

class LogoutUseCase: UseCase {
    
    typealias GenericParameterType = Void
    typealias GenericResultType = Bool
    
    private var repository: AuthenticationRepositoryProtocol
    
    init(repository: AuthenticationRepositoryProtocol) {
        
        self.repository = repository
    }
    
    func execute(params: Void) {
        self.repository.logout()
    }
    
    func result() -> Observable<Bool> {

        return self.repository.isSessionActive()
    }
}
