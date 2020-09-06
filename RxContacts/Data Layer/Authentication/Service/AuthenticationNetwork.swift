//
//  AuthenticationNetwork.swift
//  RxContacts
//
//  Created by Jobson Mateus on 06/09/20.
//  Copyright © 2020 Jobson Mateus. All rights reserved.
//

import Foundation
import Moya
import RxSwift

class AuthenticationNetwork: AuthenticationNetworkable {
    
    var provider = MoyaProvider<AuthenticationApi>()
    
    func login(email: String,
               password: String,
               disposeBag: DisposeBag,
               completion: @escaping ((SessionDTO?, Error?) -> Void)
    ) {
        
        self.provider.rx.request(.login(email: email, password: password))
            .debug()
            .Rmap(to: SessionDTO.self)
            .subscribe(onSuccess: { (session) in
                
                completion(session, nil)
                
            }) { (error) in
                
                completion(nil, error)
                
            }.disposed(by: disposeBag)
    }
    
    func signup(user: UserDTO,
                disposeBag: DisposeBag, 
                completion: @escaping ((SessionDTO?, Error?) -> Void)
    ) {
        
        guard let userDTO = user.toDictionary() as? [String: Any] else { return }
        
        self.provider.rx.request(.signup(user: userDTO))
            .debug()
            .Rmap(to: SessionDTO.self)
            .subscribe(onSuccess: { (session) in
                
                completion(session, nil)
                
            }) { (error) in
                
                completion(nil, error)
                
            }.disposed(by: disposeBag)
    }
    
    func logout(token: String,
                disposeBag: DisposeBag,
                completion: @escaping ((Error?) -> Void)
    ) {
        
        self.provider.rx.request(.logout(token: token))
            .debug()
            .subscribe(onSuccess: { (_) in
                
                completion(nil)
                
            }) { (error) in
                
                completion(error)
                
            }.disposed(by: disposeBag)
    }
    
    func deleteUsers(id: String,
                     disposeBag: DisposeBag,
                     completion: @escaping ((Error?) -> Void)) {
        
        self.provider.rx.request(.delete(id: id))
            .debug()
            .subscribe(onSuccess: { (_) in
                
                completion(nil)
                
            }) { (error) in
                
                completion(error)
                
            }.disposed(by: disposeBag)
    }
}
