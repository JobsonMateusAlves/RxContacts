//
//  AuthenticationLocalRepositoryTests.swift
//  RxContactsTests
//
//  Created by Jobson Mateus on 05/09/20.
//  Copyright © 2020 Jobson Mateus. All rights reserved.
//

import XCTest
import RxSwift
@testable import RxContacts

class AuthenticationLocalRepositoryTests: XCTestCase {
    
    var localRepository: AuthenticationLocalRepository!
    var bag: DisposeBag!
    override func setUpWithError() throws {
        self.bag = DisposeBag()
        self.localRepository = AuthenticationLocalRepository(realm: realm, userDefaults: UserDefaults())
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCreateSession() {
        
        //Condição prévia.
        self.localRepository.logout()
        //Fim condição prévia.
        
        let session = self.createSession(user: self.createUser())
        
        self.localRepository.create(session: session)
        
        self.localRepository.isSessionActive
            .subscribe(onNext: { (active) in
                
                XCTAssertTrue(active)
                
            }).disposed(by: self.bag)
        
        XCTAssertFalse(self.localRepository.token.isEmpty)
        XCTAssertEqual(session.token, self.localRepository.token)
        
        self.localRepository.user
            .subscribe(onNext: { (user) in
                
                XCTAssertEqual(session.user?.id, user?.id)
                XCTAssertEqual(session.user?.name, user?.name)
                XCTAssertEqual(session.user?.photo, user?.photo)
                XCTAssertEqual(session.user?.email, user?.email)
                
                XCTAssertNil(user?.password)
                
            }).disposed(by: self.bag)
    }
    
    func testDeleteSession() {
        
        //Condição prévia.
        let session = self.createSession(user: self.createUser())
        
        self.localRepository.create(session: session)
        //Fim condição prévia.
        
        self.localRepository.logout()
        
        self.localRepository.isSessionActive
            .subscribe(onNext: { (active) in
                
                XCTAssertFalse(active)
                
            }).disposed(by: self.bag)
        
        XCTAssertTrue(self.localRepository.token.isEmpty)
        
        self.localRepository.user
            .subscribe(onNext: { (user) in
                
                XCTAssertNil(user)
                
            }).disposed(by: self.bag)
    }
    
    private func createUser() -> UserDTO {
        
        let user = UserDTO()
        
        user.id = "83udjqH8ODJDQHEd8eqio"
        user.email = "testando@gmail.com"
        user.name = "Teste"
        user.photo = "https://3.bp.blogspot.com/-eeX1iXI0Jkc/UPgVPtWPacI/AAAAAAAAAH4/-Qbe-muKsyY/s1600/papel-de-parede-sasuke-3.jpg"
        user.password = "12345678"
        
        return user
    }
    
    private func createSession(user: UserDTO) -> SessionDTO {
        
        let session = SessionDTO()
        
        session.user = user
        session.token = "d8039KIDOKW3JKDOkk_3jdokqo-ddhoiPOKD3ODIQJKDMndiojoNoidj3ndiokdnjjkendowedpoODKD.DEDJKELDIEJDKLdejdkwednimo"
        
        return session
    }
}
