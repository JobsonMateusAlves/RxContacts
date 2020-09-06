//
//  AuthenticationApi.swift
//  RxContatos
//
//  Created by Jobson Mateus on 24/08/20.
//  Copyright © 2020 jobson. All rights reserved.
//

import Alamofire
import Moya

enum AuthenticationApi {
    case login(email: String, password: String)
    case signup(user: [String: Any])
    case logout(token: String)
    case delete(id: String)
}

extension AuthenticationApi: TargetType {
    var baseURL: URL {
        
        return URL(string: "http://contatosapi.herokuapp.com/api")!
    }
    
    var path: String {
        switch self {
        case .login(_, _):
            return "/login"
        case .signup(_):
            return "/signup"
        case .logout(_):
            return "/logout"
        case .delete(let id):
            return "/users/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .logout(_), .delete(_):
            return Method.delete
        default:
            return Method.post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .login(let email, let password):
            
            let parameters: Parameters = ["email": email, "password": password]
            
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            
        case .signup(let user):
            
            return .requestParameters(parameters: user, encoding: JSONEncoding.default)
            
        case .logout(_), .delete(_):
            
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        
        switch self {
        case .logout(let token):
            return ["token": token]
        default:
            return nil
        }
    }
}



























//class AuthenticationApi: AuthenticationApiProtocol {
//
//    func login(email: String, password: String) -> DataRequest{
//
//        let parameters: Parameters = ["email": email,
//                                      "password": password]
//
//        return AF.request("\(baseUrl)/login",
//                          method: .post,
//                          parameters: parameters,
//                          encoding: JSONEncoding.default)
//    }
//
//    func logout(token: String) -> DataRequest {
//
//        return AF.request("\(baseUrl)/logout", method: .delete, headers: ["token": token])
//    }
//
//    func signup(user: UserModel) -> DataRequest {
//
//        return AF.request("\(baseUrl)/signup",
//                          method: .delete,
//                          parameters: user.toJSON(),
//                          encoding: JSONEncoding.default)
//    }
//}
