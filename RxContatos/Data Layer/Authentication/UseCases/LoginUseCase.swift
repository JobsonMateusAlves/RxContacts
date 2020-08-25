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
    typealias GenericResultType = User
    
    var repository: AuthenticationRepository
    
    init(repository: AuthenticationRepository) {
        
        self.repository = repository
    }
    
    func execute(params: (email: String, password: String)) {
        self.repository.login(email: params.email, password: params.password)
    }
    
    func result() -> Observable<User> {

        return Observable.create { (observer) -> Disposable in
            
            let user = self.repository.getUser()
            
            observer.onNext(user)
            observer.onCompleted()
            
            return Disposables.create()
        }
    }
}
