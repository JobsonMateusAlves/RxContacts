//
//  SessionDTO.swift
//  RxContatos
//
//  Created by Jobson Mateus on 24/08/20.
//  Copyright © 2020 jobson. All rights reserved.
//

import Foundation
import EVReflection

class SessionDTO: EVObject {
    
    var user: UserDTO?
    var token: String?
}
