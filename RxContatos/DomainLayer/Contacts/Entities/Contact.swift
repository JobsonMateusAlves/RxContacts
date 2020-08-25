//
//  Contato.swift
//  RxContatos
//
//  Created by NATI on 20/08/20.
//  Copyright © 2020 jobson. All rights reserved.
//

import Foundation

public struct Contact {
    
    public let id: String
    public let userId: String
    public let name: String
    public let photo: String
    public let email: String
    public let phone: String
    
    init(id: String, userId: String, name: String, photo: String, email: String, phone: String) {
        self.id = id
        self.userId = userId
        self.name = name
        self.photo = photo
        self.email = email
        self.phone = phone
    }
}
