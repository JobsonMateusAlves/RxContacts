//
//  ContactsApi.swift
//  RxContatos
//
//  Created by Jobson Mateus on 24/08/20.
//  Copyright © 2020 jobson. All rights reserved.
//

import Foundation
import Alamofire

//class ContactsApi {
//    
//    func createContact(contact: ContactModel) -> DataRequest {
//        
//        return AF.request("\(baseUrl)/contacts",
//                                 method: .post,
//                                 parameters: contact.toJSON(),
//                                 encoding: JSONEncoding.default,
//                                 headers: [:])
//    }
//    
//    func getContacts() -> DataRequest {
//        
//        return AF.request("\(baseUrl)/contacts", method: .get, headers: [:])
//    }
//    
//    func getContact(id: String) -> DataRequest {
//        
//        return AF.request("\(baseUrl)/contacts/\(id)", method: .get, headers: [:])
//    }
//    
//    func updateContact(id: String, contact: ContactModel) -> DataRequest {
//        
//        return AF.request("\(baseUrl)/contacts/\(id)",
//                                 method: .put,
//                                 parameters: contact.toJSON(),
//                                 encoding: JSONEncoding.default,
//                                 headers: [:])
//    }
//    
//    func deleteContact(id: String) -> DataRequest {
//        
//        return AF.request("\(baseUrl)/contacts/\(id)", method: .delete, headers: [:])
//    }
//}
