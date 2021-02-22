//
//  PaymentsViewController.swift
//  AEONTestTask
//
//  Created by Мехрафруз on 21.02.2021.
//  Copyright © 2021 Мехрафруз. All rights reserved.
//

import UIKit

class PaymentsViewController: UIViewController {
    var payments: Payments?
    private let tableView = UITableView()
    private let goBackButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func setup(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .white
        tableView.register(PaymentsTableViewCell.self, forCellReuseIdentifier: "PaymentsTableViewCell")
        tableView.frame = view.frame
        
        setupLittleButton(button: goBackButton, image: UIImage(systemName: "arrow.left")!, tintColor: ColorPalette.green)
        
        goBackButton.addTarget(self, action: #selector(didClickedGoBackButton), for: .touchUpInside)
        
        [tableView, goBackButton].forEach{
            view.addSubview($0)
        }
        
        [tableView, goBackButton].forEach{
            ($0).translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            goBackButton.widthAnchor.constraint(equalToConstant: 30),
            goBackButton.heightAnchor.constraint(equalToConstant: 30),
            goBackButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
            goBackButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
    }
    
    func setupLittleButton(button: UIButton, image: UIImage, tintColor: UIColor) {
        let image = image
        button.setBackgroundImage( image, for: UIControl.State.normal)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.tintColor = tintColor
    }
    
    @objc
    func didClickedGoBackButton() {
        goBackButton.pulsate()
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension PaymentsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return payments?.response.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentsTableViewCell", for: indexPath) as? PaymentsTableViewCell else {
            return .init()
        }
        
        guard let amount = payments?.response[indexPath.row].amount else {
            return .init()
        }

        cell.configure(with: PaymentsTableViewCellModel(desc: payments?.response[indexPath.row].desc ?? "", amount: String(amount), currency: payments?.response[indexPath.row].currency ?? "", created: payments?.response[indexPath.row].created ?? 0))
        return cell
    }

    
     func numberOfSections(in tableView: UITableView) -> Int {
           return 1
       }
}
