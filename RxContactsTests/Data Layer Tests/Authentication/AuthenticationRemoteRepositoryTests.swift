//
//  AuthenticationRemoteRepositoryTests.swift
//  RxContactsTests
//
//  Created by Jobson Mateus on 05/09/20.
//  Copyright © 2020 Jobson Mateus. All rights reserved.
//

import XCTest
import Alamofire
@testable import RxContacts


class AuthenticationRemoteRepositoryTests: XCTestCase {

    var remoteRepository: AuthenticationRemoteRepository!
    
    override func setUpWithError() throws {
        self.remoteRepository = AuthenticationRemoteRepository(api: AuthenticationApi())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLoginResponseSuccess() {
        
        var sessionDTO: SessionDTO?
        var erro: Error?
        
        let exp = expectation(description: "Check Login is successful")
        
        self.remoteRepository.login(email: "jobson@gmail.com", password: "12341234") { (session, error) in
            
            sessionDTO = session
            erro = error
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error) in
            if let _ = error {
                XCTFail("Timeout")
            }
            
            XCTAssertNil(erro)
            
            XCTAssertNotNil(sessionDTO)
            XCTAssertNotNil(sessionDTO?.token)
            
            XCTAssertNotNil(sessionDTO?.user)
            XCTAssertNotNil(sessionDTO?.user?.id)
            XCTAssertNotNil(sessionDTO?.user?.name)
            XCTAssertNotNil(sessionDTO?.user?.email)
            XCTAssertNotNil(sessionDTO?.user?.photo)
            
            XCTAssertEqual("jobson@gmail.com", sessionDTO?.user?.email)
        }
    }
    
    func testLoginResponseFailure() {
        
        var sessionDTO: SessionDTO?
        var erro: Error?
        
        let exp = expectation(description: "Check Login is successful")
        
        self.remoteRepository.login(email: "jobson@gmail.com", password: "") { (session, error) in
            
            sessionDTO = session
            erro = error
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error) in
            if let _ = error {
                XCTFail("Timeout")
            }
            
            XCTAssertNotNil(erro)
            XCTAssertNil(sessionDTO)
            XCTAssertEqual("Email e/ou senha incorretos", erro?.localizedDescription)
            //TODO: Tratamento de erro
        }
    }
    
    func testSignupSuccess() {
        
        var sessionDTO: SessionDTO?
        var erro: Error?
        let user = self.createUser()
        let exp = expectation(description: "Check Signup is successful")
        
        self.remoteRepository.signup(user: user) { (session, error) in
            sessionDTO = session
            erro = error
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error) in
            if let _ = error {
                XCTFail("Timeout")
            }
            
            XCTAssertNil(erro)
            
            XCTAssertNotNil(sessionDTO)
            XCTAssertNotNil(sessionDTO?.token)
            
            XCTAssertNotNil(sessionDTO?.user)
            XCTAssertNotNil(sessionDTO?.user?.id)
            
            XCTAssertEqual(user.email, sessionDTO?.user?.email)
            XCTAssertEqual(user.name, sessionDTO?.user?.name)
            XCTAssertEqual(user.photo, sessionDTO?.user?.photo)
            
            if let id = sessionDTO?.user?.id {
                let _ = self.delete(id: id)
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
    
    private func delete(id: String) -> DataRequest {
        
        return AF.request("\(baseUrl)/users/\(id)", method: .delete)
    }
}

