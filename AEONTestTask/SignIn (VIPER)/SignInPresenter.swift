//
//  SignInPresenter.swift
//  AEONTestTask
//
//  Created by Мехрафруз on 20.02.2021.
//  Copyright © 2021 Мехрафруз. All rights reserved.
//

import Foundation

final class SignInPresenter {
	weak var view: SignInViewInput?
    weak var moduleOutput: SignInModuleOutput?

	private let router: SignInRouterInput
	private let interactor: SignInInteractorInput

    init(router: SignInRouterInput, interactor: SignInInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension SignInPresenter: SignInModuleInput {
    
}

extension SignInPresenter: SignInViewOutput {
   
    
    func auth(email: String, pass: String){
        interactor.loadToken(email: email, pass: pass)
    }
}

extension SignInPresenter: SignInInteractorOutput {

    func didLoadToken(token: String) {
        interactor.loadPayments(token: token)
           //грузим дальше
       }
    func didLoadPayments(payments: Payments) {
        router.show(payments)
    }
    
    func didFail(with error: Error) {
        print ("did fail when load some data")
    }
}
