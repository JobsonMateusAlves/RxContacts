//
//  UserModel.swift
//  RxContatos
//
//  Created by Jobson Mateus on 24/08/20.
//  Copyright © 2020 jobson. All rights reserved.
//

import Foundation
import RealmSwift
import EVReflection

class UserModel: Object {
    
    @objc dynamic var id: String?
    @objc dynamic var name: String?
    @objc dynamic var photo: String?
    @objc dynamic var email: String?
    
    var password: String?
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
