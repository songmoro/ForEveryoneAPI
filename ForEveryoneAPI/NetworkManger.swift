//
//  NetworkManger.swift
//  ForEveryoneAPI
//
//  Created by 송재훈 on 11/9/23.
//

import SwiftUI
import Moya

enum API {
    /// Get 유저 리스트
    case GetUserList(page: Int? = nil, delay: Int? = nil)
    /// Get 싱글 유저
    case GetSingleUser(id: Int)
    /// Post 유저
    case CreateUser(name: String, job: String)
    /// Patch 유저
    case UpdateUser(id: Int, name: String, job: String)
    /// Delete 유저
    case DeleteUser(id: Int)
    /// Post 가입
    case Register(email: String, password: String? = nil)
    /// Post 로그인
    case Login(email: String, password: String? = nil)
}

extension API: TargetType {
    var headers: [String : String]? {
        switch self {
        default:
            return ["Content-Type": "application/json"]
        }
    }
    
    var baseURL: URL {
        return URL(string: "https://reqres.in/api")!
    }
    
    var method: Moya.Method {
        switch self {
        case .GetUserList: return .get
        case .GetSingleUser: return .get
        case .CreateUser: return .post
        case .UpdateUser: return .patch
        case .DeleteUser: return .delete
        case .Register: return .post
        case .Login: return .post
        }
    }
    
    var path: String {
        switch self {
        case .GetUserList: return "/users"
        case .GetSingleUser(let id): return "/users/\(id)"
        case .CreateUser: return "/users"
        case .UpdateUser(let id, _, _): return "/users/\(id)"
        case .DeleteUser(let id): return "/users/\(id)"
        case .Register: return "/register"
        case .Login: return "/login"
        }
    }
    
    var task: Task {
        switch self {
        case .GetUserList(let page, let delay):
            if let delay = delay {
                return .requestParameters(parameters: ["delay": delay], encoding: URLEncoding.queryString)
            }
            else {
                return .requestParameters(parameters: ["page": page!], encoding: URLEncoding.queryString)
            }
        case .GetSingleUser:
            return .requestPlain
        case .CreateUser(let name, let job):
            return .requestJSONEncodable(["name": name, "job": job])
        case .UpdateUser(_ , let name, let job):
            return .requestJSONEncodable(["name": name, "job": job])
        case .DeleteUser:
            return .requestPlain
        case .Register(let email, let password):
            if let password = password {
                return .requestJSONEncodable(["email": email, "password": password])
            }
            else {
                return .requestJSONEncodable(email)
            }
        case .Login(let email, let password):
            if let password = password {
                return .requestJSONEncodable(["email": email, "password": password])
            }
            else {
                return .requestJSONEncodable(["email": email])
            }
        }
    }
}

class NetworkManger {
    static func request<T>(for target: API, type: T.Type, completion: @escaping ((Result<T, MoyaError>) -> ())) where T: Codable {
        let provider = MoyaProvider<API>()
        
        provider.request(target) { result in
            switch result {
            case .success(let response):
                if (200..<300).contains(response.statusCode) || response.statusCode == 400 {
                    if let decodedData = try? JSONDecoder().decode(type, from: response.data) {
                        completion(.success(decodedData))
                    }
                    else {
                        completion(.failure(.requestMapping("decode error")))
                    }
                }
                else {
                    completion(.failure(.statusCode(response)))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
