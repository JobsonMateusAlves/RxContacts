//
//  ContactRepositoryProtocol.swift
//  RxContatos
//
//  Created by NATI on 20/08/20.
//  Copyright © 2020 jobson. All rights reserved.
//

import Foundation

protocol Repository {
    func getItem()
    func getItems()
    func create()
    func update()
    func delete()
}
