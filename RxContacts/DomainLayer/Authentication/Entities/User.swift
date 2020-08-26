//
//  User.swift
//  RxContatos
//
//  Created by Jobson Mateus on 24/08/20.
//  Copyright © 2020 jobson. All rights reserved.
//

import Foundation

public struct User {
    
    var id: String = ""
    var name: String = ""
    var photo: String = ""
    var email: String = ""
    var password: String = ""
    
    init(id: String?, name: String?, photo: String?, email: String?, password: String? = nil) {
        self.id = id ?? ""
        self.name = name ?? ""
        self.photo = photo ?? ""
        self.email = email ?? ""
        self.password = password ?? ""
    }
}
