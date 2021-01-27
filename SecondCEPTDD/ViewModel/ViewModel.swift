//
//  ViewModel.swift
//  SecondCEPTDD
//
//  Created by The App Experts on 22/01/2021.
//  Copyright © 2021 The App Experts. All rights reserved.
//

import Foundation

class ViewModel: NSObject {
    var accountsList:[Account] = [Account]()
    
    override init() {
    }

    func setAccountsList (using data:Data?) {
        guard let accounts = JsonFileLoader(decoder: JSONDecoder()).fetch(from: data) else {return}
        self.accountsList = accounts
    }
    
}
