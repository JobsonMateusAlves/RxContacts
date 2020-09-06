//
//  UserDTO.swift
//  RxContacts
//
//  Created by Jobson Mateus on 06/09/20.
//  Copyright © 2020 Jobson Mateus. All rights reserved.
//

import Foundation
import EVReflection

class UserDTO: EVObject {
    var id: String?
    var name: String?
    var photo: String?
    var email: String?
    var password: String?
}
