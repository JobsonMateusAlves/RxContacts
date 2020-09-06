//
//  LoginViewModel.swift
//  RxContatos
//
//  Created by Jobson Mateus on 25/08/20.
//  Copyright © 2020 jobson. All rights reserved.
//

import Foundation
import RxRelay
import RxSwift

class LoginViewModel: LoginViewModelProtocol {
    
    var useCase: LoginUseCase
    
    var disposeBag: DisposeBag
    
    private var isLoading = BehavoirRelay<Bool>(defaultValue: false)
    var _isLoading: Observable<Bool> {
        get {
            self.isLoading.asObservable()
        }
    }
    
    init(useCase: LoginUseCase, disposeBag: DisposeBag) {
        self.useCase = useCase
        self.disposeBag = disposeBag
    }
    
    func login(email: String, password: String) {
    
        self.isLoading.accept(true)
        self.useCase.execute(params: (email: email, password: password))
    }
    
    func result() -> Observable<Bool>  {
        
        let result = self.useCase.result()
        
        result.debug()
            .subscribe(onNext: { (isSessionActive) in
                
                print(isSessionActive)
                self.isLoading.accept(false)
                
            }, onError: { (error) in
                
                print(error.localizedDescription)
                self.isLoading.accept(false)
                
            }).disposed(by: self.disposeBag)
        
        return result
    }
}
