//
//  AuthenticationRemoteRepositoryTests.swift
//  RxContactsTests
//
//  Created by Jobson Mateus on 05/09/20.
//  Copyright © 2020 Jobson Mateus. All rights reserved.
//

import XCTest
import RxSwift
@testable import RxContacts


class AuthenticationRemoteRepositoryTests: XCTestCase {

    var remoteRepository: AuthenticationRemoteRepositoryProtocol!
    var disposeBag: DisposeBag!
    override func setUpWithError() throws {
        self.disposeBag = DisposeBag()
        self.remoteRepository = AuthenticationRemoteRepository(api: AuthenticationNetwork(), disposeBag: self.disposeBag)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLoginResponseSuccess() {
        self.remoteRepository.login(email: "d", password: "w") { (session, error) in
            
            XCTAssertNotNil(session)
            XCTAssertNotNil(session?.token)
            XCTAssertNotNil(session?.user)
            
            XCTAssertNotNil(session?.user?.id)
            XCTAssertNotNil(session?.user?.name)
            XCTAssertNotNil(session?.user?.email)
            XCTAssertNotNil(session?.user?.photo)
        }
    }
    
    func testLoginResponseFailure() {
        self.remoteRepository.login(email: "jobson@gmail.com", password: "") { (sessionModel, error) in
            
            XCTAssertNotNil(error)
            XCTAssertEqual("Email e/ou senha incorretos", error?.localizedDescription)
        }
    }
    
    func testSignupSuccess() {
        let user = self.createUser()
        self.remoteRepository.signup(user: user) { (session, error) in
        
        
            XCTAssertNotNil(session?.token)
            XCTAssertNotNil(session)
            
            XCTAssertEqual(user, session?.user)
            XCTAssertNil(error)
            
            if let id = session?.user?.id {
                self.remoteRepository.delete(id: id) { (_) in }
            }
        }
    }
    
    private func createUser() -> UserDTO {
        
        let user = UserDTO()
        
        user.email = "testando@gmail.com"
        user.name = "Teste"
        user.photo = "https://3.bp.blogspot.com/-eeX1iXI0Jkc/UPgVPtWPacI/AAAAAAAAAH4/-Qbe-muKsyY/s1600/papel-de-parede-sasuke-3.jpg"
        user.password = "12345678"
        
        return user
    }
}

