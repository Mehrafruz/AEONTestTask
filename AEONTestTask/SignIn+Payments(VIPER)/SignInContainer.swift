//
//  SignInContainer.swift
//  AEONTestTask
//
//  Created by Мехрафруз on 20.02.2021.
//  Copyright © 2021 Мехрафруз. All rights reserved.
//

import UIKit

final class SignInContainer {
    let input: SignInModuleInput
	let viewController: UIViewController
	private(set) weak var router: SignInRouterInput!

	class func assemble(with context: SignInContext) -> SignInContainer {
        let router = SignInRouter()
        let interactor = SignInInteractor(networkManager: NetworkManager.shared)
        let presenter = SignInPresenter(router: router, interactor: interactor)
		let viewController = SignInViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter
        router.viewController = viewController

        return SignInContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: SignInModuleInput, router: SignInRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct SignInContext {
	weak var moduleOutput: SignInModuleOutput?
}
