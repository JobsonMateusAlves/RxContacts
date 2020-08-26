//
//  SessionModel.swift
//  RxContatos
//
//  Created by Jobson Mateus on 24/08/20.
//  Copyright © 2020 jobson. All rights reserved.
//

import Foundation
import ObjectMapper

class SessionModel: Mappable {
    
    var user: UserModel?
    var token: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        
        self.user       <- map["user"]
        self.token      <- map["token"]
    }
}
