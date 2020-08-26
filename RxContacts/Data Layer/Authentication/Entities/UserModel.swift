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
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    func mapping(map: Map) {
        
        self.id         <- map["_id"]
        self.name       <- map["name"]
        self.photo      <- map["photo"]
        self.email      <- map["email"]
        self.password   <- map["password"]
    }
}
