//
//  UserDTO.swift
//  RxContacts
//
//  Created by Jobson Mateus on 06/09/20.
//  Copyright © 2020 Jobson Mateus. All rights reserved.
//

import Foundation
import ObjectMapper

class UserDTO: Mappable {

    var id: String?
    var name: String?
    var photo: String?
    var email: String?
    var password: String?
    
    required init() {}
    
    init(user: User) {
        self.id = user.id
        self.name = user.name
        self.photo = user.photo
        self.email = user.email
        self.password = user.password
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    func mapping(map: Map) {
        
        self.id         <- map["_id"]
        self.name       <- map["name"]
        self.photo      <- map["photo"]
        self.email      <- map["email"]
        self.password   <- map["password"]
    }
}
