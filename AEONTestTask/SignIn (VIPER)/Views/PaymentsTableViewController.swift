//
//  PaymentsTableViewController.swift
//  AEONTestTask
//
//  Created by Мехрафруз on 22.02.2021.
//  Copyright © 2021 Мехрафруз. All rights reserved.
//

import UIKit
class PaymentsTableViewController: UITableViewController {
    var payments: Payments?
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(PaymentsTableViewCell.self, forCellReuseIdentifier: "PaymentsTableViewCell")

    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return payments?.response.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentsTableViewCell", for: indexPath) as? PaymentsTableViewCell else {
            return .init()
        }
        guard let amount = payments?.response[indexPath.row].amount else {
            return .init()
        }
        cell.configure(with: PaymentsTableViewCellModel(desc: payments?.response[indexPath.row].desc ?? "", amount: String(amount), currency: payments?.response[indexPath.row].currency ?? "", created: payments?.response[indexPath.row].created ?? 0))
        return cell
    }
}
