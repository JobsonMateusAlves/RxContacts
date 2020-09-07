//
//  SessionDTO.swift
//  RxContacts
//
//  Created by Jobson Mateus on 06/09/20.
//  Copyright © 2020 Jobson Mateus. All rights reserved.
//

import Foundation
import ObjectMapper

class SessionDTO: Mappable {
    
    var user: UserDTO?
    var token: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        
        self.user       <- map["user"]
        self.token      <- map["token"]
    }
}
