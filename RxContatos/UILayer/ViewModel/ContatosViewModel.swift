//
//  ContatosViewModel.swift
//  RxContatos
//
//  Created by Jobson Mateus on 16/08/20.
//  Copyright © 2020 Jobson Mateus. All rights reserved.
//

//import Foundation
//import Alamofire
//
//protocol ContatosViewModelDelegate {
//
//    func didSetContatos()
//    func didSetError()
//}
//
//struct ContatoView {
//    var _id: String = ""
//
//    init(contato: Contact) {
//        self._id = contato._id
//    }
//}
//
//class ContatosViewModel {
//
//    var contatos: [ContatoView] = [] {
//        didSet {
//            self.delegate?.didSetContatos()
//        }
//    }
//
//    var error: AFError? {
//        didSet {
//            self.delegate?.didSetError()
//        }
//    }
//
//    var repository: ContatosRepository?
//    var delegate: ContatosViewModelDelegate?
//
//    func initialize(delegate: ContatosViewModelDelegate) {
//        self.delegate = delegate
//
//        self.repository = ContatosRepository()
//        self.repository?.initialize(delegate: self)
//    }
//
//    func getContatos() {
//
//        self.repository?.getContatos()
//    }
//}
//
//extension ContatosViewModel: ContatosRepositoryDelegate {
//    func getContatosResponse(value: [Contact]?, error: AFError?) {
//        if let value = value {
//            self.contatos = value.map({ (contato) -> ContatoView in
//                ContatoView(contato: contato)
//            })
//        }
//
//        self.error = error
//    }
//}
