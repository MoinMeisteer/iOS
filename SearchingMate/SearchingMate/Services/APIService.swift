//
//  APIService.swift
//  SearchingMate
//
//  Created by Leon Langhauser on 22.06.22.
//

import Foundation

class APIService {
    static let shared = APIService()

    
    func login(credentials: Credentials,
               completion: @escaping (Result<Bool,Authentication.AuthenticationError>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if credentials.password == "password" {
                completion(.success(true))
            } else {
                completion(.failure(.invalidCredentials))
            }
        }
    }
}
