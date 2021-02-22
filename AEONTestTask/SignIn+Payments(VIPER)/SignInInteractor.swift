//
//  SignInInteractor.swift
//  AEONTestTask
//
//  Created by Мехрафруз on 20.02.2021.
//  Copyright © 2021 Мехрафруз. All rights reserved.
//

import Foundation

final class SignInInteractor {
	weak var output: SignInInteractorOutput?
    private let networkManager: NetworkManagerDescription

    init(networkManager: NetworkManagerDescription) {
        self.networkManager = networkManager
    }
}

extension SignInInteractor: SignInInteractorInput {
    
    
    func loadToken(email: String, pass: String) {
        networkManager.auth(email: email, pass: pass) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let user):
                    self?.output?.didLoadToken(token: user.response.token)
                case .failure(let error):
                    self?.output?.didFail(with: error)
                }
            }
        }
    }
    
    func loadPayments(token: String) {
        networkManager.getPayments(token: token) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let payments):
                    self?.output?.didLoadPayments(payments: payments)
                case .failure(let error):
                    print (error)
                    self?.output?.didFail(with: error)
                }
            }
        }
    }
    
}
