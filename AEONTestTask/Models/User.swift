//
//  Token.swift
//  AEONTestTask
//
//  Created by Мехрафруз on 21.02.2021.
//  Copyright © 2021 Мехрафруз. All rights reserved.
//

import Foundation

struct User: Codable{
    struct Response: Codable{
        let token: String
    }
    
    let response: Response
}
