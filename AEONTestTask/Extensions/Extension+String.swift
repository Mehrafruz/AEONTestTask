//
//  Extension+String.swift
//  AEONTestTask
//
//  Created by Мехрафруз on 22.02.2021.
//  Copyright © 2021 Мехрафруз. All rights reserved.
//

import Foundation

extension String {
    init(_ amount:Amount) {
        switch amount {
        case .double(let value):
            self = String(value)
        case .string(let value):
            self = value
        }

    }
}
