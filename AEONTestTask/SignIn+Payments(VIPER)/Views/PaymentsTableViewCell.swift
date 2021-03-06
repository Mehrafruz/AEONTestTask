//
//  PaymentsTableViewCell.swift
//  AEONTestTask
//
//  Created by Мехрафруз on 21.02.2021.
//  Copyright © 2021 Мехрафруз. All rights reserved.
//

import UIKit

struct PaymentsTableViewCellModel {
    let desc: String
    let amount: String
    let currency: String
    let created: Int
}

class PaymentsTableViewCell: UITableViewCell {
    
    private let descLabel = UILabel()
    private let amoutLabel = UILabel()
    private let currencyLabel = UILabel()
    private let createdLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        setupLabel(label: descLabel, fontSize: 17)
        setupLabel(label: amoutLabel, fontSize: 15)
        setupLabel(label: currencyLabel, fontSize: 15)
        setupLabel(label: createdLabel, fontSize: 15)
        
        [descLabel, amoutLabel, currencyLabel, createdLabel].forEach {
            contentView.addSubview($0)
            ($0).numberOfLines = 2
            ($0).lineBreakMode = .byClipping
        }
        
        [amoutLabel, currencyLabel].forEach {
            ($0).textAlignment = .right
        }
        createdLabel.textAlignment = .left
        
        addConstraints()
    }
    
    func setupLabel(label: UILabel, fontSize: CGFloat){
        label.font = UIFont(name: "POEVeticaVanta", size: fontSize)
        label.textColor = ColorPalette.black
        label.textAlignment = .center
    }
    
    func addConstraints(){
        [descLabel, amoutLabel, currencyLabel, createdLabel].forEach {
            ($0).translatesAutoresizingMaskIntoConstraints = false
        }
        
        let width = UIScreen.main.bounds.width-40
        let labelHeight: CGFloat = 20
        let lineSpasing: CGFloat = 2
        let leftAnchor: CGFloat = 20
        
        NSLayoutConstraint.activate([
            descLabel.widthAnchor.constraint(equalToConstant: width),
            descLabel.heightAnchor.constraint(equalToConstant: 40),
            descLabel.topAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: lineSpasing),
            descLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: leftAnchor)
        ])
        
        NSLayoutConstraint.activate([
            amoutLabel.widthAnchor.constraint(equalToConstant: width),
            amoutLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            amoutLabel.topAnchor.constraint(equalTo: self.descLabel.bottomAnchor, constant: lineSpasing),
            amoutLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: leftAnchor)
        ])
        
        NSLayoutConstraint.activate([
            currencyLabel.widthAnchor.constraint(equalToConstant: width),
            currencyLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            currencyLabel.topAnchor.constraint(equalTo: self.amoutLabel.bottomAnchor, constant: lineSpasing),
            currencyLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: leftAnchor)
        ])
        
        NSLayoutConstraint.activate([
            createdLabel.widthAnchor.constraint(equalToConstant: width),
            createdLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            createdLabel.topAnchor.constraint(equalTo: self.currencyLabel.bottomAnchor, constant: lineSpasing),
            createdLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: leftAnchor)
        ])
    }
    
    func configure(with model: PaymentsTableViewCellModel) {
        descLabel.text = model.desc
        amoutLabel.text = "Amount: " + model.amount
        currencyLabel.text = "Currency: " + model.currency
        createdLabel.text = "Created on " + String(model.created)
    }
    
}
