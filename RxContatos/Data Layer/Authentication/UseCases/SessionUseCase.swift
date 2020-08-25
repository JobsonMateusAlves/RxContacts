//
//  SessionUseCase.swift
//  RxContatos
//
//  Created by Jobson Mateus on 25/08/20.
//  Copyright © 2020 jobson. All rights reserved.
//

import Foundation
import RxSwift

class SessionUseCase: UseCase {
    
    typealias GenericParameterType = Void
    typealias GenericResultType = Bool
    
    var repository: AuthenticationRepository
    
    init(repository: AuthenticationRepository) {
        
        self.repository = repository
    }
    
    func execute(params: Void) {}
    
    func result() -> Observable<Bool> {
        return Observable.create { (observer) -> Disposable in
            
            observer.onNext(self.repository.isSessionActive())
            observer.onCompleted()
            
            return Disposables.create()
        }
    }
}
