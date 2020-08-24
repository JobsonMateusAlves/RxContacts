//
//  UserModel.swift
//  RxContatos
//
//  Created by Jobson Mateus on 24/08/20.
//  Copyright © 2020 jobson. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class UserModel: Object, Mappable {
    
    @objc dynamic var id: String?
    @objc dynamic var name: String?
    @objc dynamic var photo: String?
    @objc dynamic var email: String?
    
    var password: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        
        self.id         <- map["id"]
        self.name       <- map["name"]
        self.photo      <- map["photo"]
        self.email      <- map["email"]
        self.password   <- map["password"]
    }
}
