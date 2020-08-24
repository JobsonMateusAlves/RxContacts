//
//  ContactModel.swift
//  RxContatos
//
//  Created by NATI on 20/08/20.
//  Copyright © 2020 jobson. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class ContactModel: Object, Mappable {
    
    @objc dynamic var id: String?
    @objc dynamic var userId: String?
    @objc dynamic var name: String?
    @objc dynamic var photo: String?
    @objc dynamic var email: String?
    @objc dynamic var phone: String?

    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        
        self.id         <- map["_id"]
        self.userId     <- map["userId"]
        self.name       <- map["name"]
        self.photo      <- map["photo"]
        self.email      <- map["email"]
        self.phone      <- map["phone"]
    }
}
