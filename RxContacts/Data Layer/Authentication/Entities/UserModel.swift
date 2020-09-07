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

class UserModel: Object {
    
    @objc dynamic var id: String?
    @objc dynamic var name: String?
    @objc dynamic var photo: String?
    @objc dynamic var email: String?
    
    required init() {}
    
    init(user: UserDTO) {
        self.id = user.id
        self.name = user.name
        self.photo = user.photo
        self.email = user.email
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
