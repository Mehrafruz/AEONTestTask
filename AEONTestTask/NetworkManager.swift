//
//  NetworkManager.swift
//  AEONTestTask
//
//  Created by Мехрафруз on 21.02.2021.
//  Copyright © 2021 Мехрафруз. All rights reserved.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case emptyData
    
    var errorDescription: String {
        switch self {
        case .invalidURL:
            return "invalid url!!"
        case .emptyData:
            return "no data!!"
        }
    }
}

protocol NetworkManagerDescription: AnyObject {
    func auth(email: String, pass: String, completion: @escaping (Result<User, Error>) -> Void)
    func getPayments(token: String, completion: @escaping (Result<Payments, Error>) -> Void)
}

final class NetworkManager: NetworkManagerDescription {
    static let shared: NetworkManagerDescription = NetworkManager()
    
    let headers: HTTPHeaders = [
    "app-key": "12345",
    "v": "1"]
    
    func auth(email: String, pass: String, completion: @escaping (Result<User, Error>) -> Void) {
        let urlString = "http://82.202.204.94/api/login"
        let parameters = [
            "login": email,
            "password": pass]
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseJSON { response in
                switch response.result{
                case .success(_):
                    guard let data = response.data, !data.isEmpty else {
                       completion(.failure(NetworkError.emptyData))
                        return
                    }
                    let decoder = JSONDecoder()
                    do {
                        let user = try decoder.decode(User.self, from: data)
                       completion(.success(user))
                    } catch let error {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    print (error)
                    completion(.failure(error))
                    return
                }
        }
    }
    
    
    func getPayments(token: String, completion: @escaping (Result<Payments, Error>) -> Void){
        let urlString = "http://82.202.204.94/api/payments?token=\(token)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseJSON { response in
                switch response.result{
                case .success(_):
                    guard let data = response.data, !data.isEmpty else {
                        completion(.failure(NetworkError.emptyData))
                        return
                    }
                    let decoder = JSONDecoder()
                    do {
                        let user = try decoder.decode(Payments.self, from: data)
                        completion(.success(user))
                    } catch let error {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    print (error)
                    completion(.failure(error))
                    return
                }
        }
    }
    
}

