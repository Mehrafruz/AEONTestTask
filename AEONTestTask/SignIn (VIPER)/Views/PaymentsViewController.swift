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

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
    }
    
    func setup(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .white
        tableView.register(PaymentsTableViewCell.self, forCellReuseIdentifier: "PaymentsTableViewCell")
        tableView.frame = view.frame
        
        [tableView].forEach{
            view.addSubview($0)
        }
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
    }
}

extension PaymentsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return payments?.response.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
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
