//
//  LoginViewModelProtocol.swift
//  RxContatos
//
//  Created by Jobson Mateus on 25/08/20.
//  Copyright © 2020 jobson. All rights reserved.
//

import Foundation
import RxSwift

protocol LoginViewModelProtocol {
    
    func login(email: String, password: String)
    func result() -> Observable<Bool>
}
