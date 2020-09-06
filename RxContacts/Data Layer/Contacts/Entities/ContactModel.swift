//
//  ContactModel.swift
//  RxContatos
//
//  Created by NATI on 20/08/20.
//  Copyright © 2020 jobson. All rights reserved.
//

import Foundation
import RealmSwift

class ContactModel: Object {
    
    @objc dynamic var id: String?
    @objc dynamic var userId: String?
    @objc dynamic var name: String?
    @objc dynamic var photo: String?
    @objc dynamic var email: String?
    @objc dynamic var phone: String?
}
