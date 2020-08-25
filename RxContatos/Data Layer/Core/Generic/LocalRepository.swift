//
//  LocalRepository.swift
//  RxContatos
//
//  Created by Jobson Mateus on 24/08/20.
//  Copyright © 2020 jobson. All rights reserved.
//

import Foundation
import RealmSwift

class LocalRepository<T: Object> {
    
    //MARK: Vars
    var realm: Realm
    var userDefaults: UserDefaults
    
    //MARK: Inits
    init(realm: Realm, userDefaults: UserDefaults) {
        self.realm = realm
        self.userDefaults = userDefaults
    }
    
    //MARK: Save methods
    func save(object: T, update: Realm.UpdatePolicy = .all) {
        
        try? self.realm.write {
            self.realm.add(object, update: update)
        }
    }
    
    func save(objects: [T], update: Realm.UpdatePolicy = .all) {
        if update == .error {
            self.delete()
        }
        
        try? self.realm.write {
            self.realm.add(objects, update: update)
        }
    }
    
    //MARK: Get methods
    func get() -> [T] {
        
        let results = self.realm.objects(T.self)
        
        var objects: [T] = []
        objects.append(contentsOf: results)
        
        return objects
    }
    
    func get(by id: Any?) -> T? {
        
        self.realm.object(ofType: T.self, forPrimaryKey: id)
    }
    
    //MARK: Delete methods
    func delete() {
        
        try? self.realm.write {
            self.realm.delete(self.realm.objects(T.self))
        }
    }
}
