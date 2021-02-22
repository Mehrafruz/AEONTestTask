//
//  SignInRouter.swift
//  AEONTestTask
//
//  Created by Мехрафруз on 20.02.2021.
//  Copyright © 2021 Мехрафруз. All rights reserved.
//

import UIKit

final class SignInRouter {
    weak var viewController: UIViewController?
}

extension SignInRouter: SignInRouterInput {
    func show(_ paiments: Payments) {
        let paymentsViewController = PaymentsViewController()
        paymentsViewController.payments = paiments
        viewController?.present(paymentsViewController, animated: true, completion: nil)
        //viewController?.navigationController?.pushViewController(paymentsViewController, animated: true)
    }
    
    func show(_ error: Error) {
        let message: String = (error as? NetworkError)?.errorDescription ?? error.localizedDescription
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
      //  viewController?.present(alertController, animated: true, completion: nil)
    }
}
