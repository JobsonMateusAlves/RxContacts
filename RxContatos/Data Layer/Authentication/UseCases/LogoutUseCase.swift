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
    typealias GenericResultType = Void
    
    var repository: AuthenticationRepository
    
    init(repository: AuthenticationRepository) {
        
        self.repository = repository
    }
    
    func execute(params: Void) {
        self.repository.logout()
    }
    
    func result() -> Observable<Void> {
        return Observable.create { (observer) -> Disposable in
            
            observer.onNext(Void())
            observer.onCompleted()
            
            return Disposables.create()
        }
    }
}
