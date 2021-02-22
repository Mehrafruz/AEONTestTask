//
//  SignInProtocols.swift
//  AEONTestTask
//
//  Created by Мехрафруз on 20.02.2021.
//  Copyright © 2021 Мехрафруз. All rights reserved.
//

import Foundation

protocol SignInModuleInput {
	var moduleOutput: SignInModuleOutput? { get }
}

protocol SignInModuleOutput: class {
}

protocol SignInViewInput: class {
}

protocol SignInViewOutput: class {
    func auth(email: String, pass: String)
   
}

protocol SignInInteractorInput: class {
    func loadToken(email: String, pass: String)
    func loadPayments(token: String)
}

protocol SignInInteractorOutput: class {
    func didLoadToken(token: String)
    func didLoadPayments(payments: Payments)
    func didFail(with error: Error)
}

protocol SignInRouterInput: class {
    func show(_ payments: Payments)
    func show(_ error: Error)
}
