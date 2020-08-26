//
//  UseCase.swift
//  RxContatos
//
//  Created by Jobson Mateus on 25/08/20.
//  Copyright © 2020 jobson. All rights reserved.
//

import Foundation
import RxSwift

protocol UseCase {
    associatedtype GenericParameterType
    associatedtype GenericResultType
    
    func execute(params: GenericParameterType)
    func result() -> Observable<GenericResultType>
}
