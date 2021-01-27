//
//  Model.swift
//  SecondCEPTDD
//
//  Created by The App Experts on 22/01/2021.
//  Copyright © 2021 The App Experts. All rights reserved.
//

import Foundation

struct Account : Codable {
    let kind:String?
    let balance:Double?
}

struct Accounts : Codable {
    let accounts: [Account]?
}
