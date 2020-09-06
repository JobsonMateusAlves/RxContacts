//
//  ViewController.swift
//  RxContacts
//
//  Created by Jobson Mateus on 26/08/20.
//  Copyright © 2020 Jobson Mateus. All rights reserved.
//

import UIKit
import RxSwift
import RealmSwift

class ViewController: UIViewController {
    
    var remoteRepository: AuthenticationRemoteRepositoryProtocol!
    var disposeBag = DisposeBag()

//    var repository = AuthenticationRepository(localRepository: AuthenticationLocalRepository(realm: realm, userDefaults: UserDefaults()),
//                                              remoteRepository: AuthenticationRemoteRepository(api: AuthenticationApi()))
    
//    var viewModel: LoginViewModel!
//
//    var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.remoteRepository = AuthenticationRemoteRepository(api: AuthenticationNetwork(), disposeBag: self.disposeBag)
        
//        self.viewModel = LoginViewModel(useCase: LoginUseCase(repository: self.repository), disposeBag: self.bag)
//
//        self.configure()
    }
    
//    func configure() {
//        self.viewModel._isLoading
//            .debug()
//            .subscribe(onNext: { (loading) in
//                print(loading ? "Loading" : "NotLoading")
//            }).disposed(by: bag)
//
//        self.viewModel.result()
//            .debug()
//            .subscribe(onNext: { (session) in
//                ScreenManager.setupInitialController(session: session)
//            }).disposed(by: self.bag)
//    }
    
    @IBAction func login() {
//        self.viewModel.login(email: "d", password: "w")
        
        self.remoteRepository.login(email: "d", password: "w") { (session, error) in
            print(session)
            print(error)
        }
    }
}

//
//class aaa {
//    
//    var k = AuthenticationLocalRepository(realm: (try? Realm())!, userDefaults: UserDefaults())
//    
//    init() {
//        k.realm.cancelWrite()
//    }
//}
