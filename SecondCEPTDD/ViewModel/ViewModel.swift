//
//  ViewModel.swift
//  SecondCEPTDD
//
//  Created by The App Experts on 22/01/2021.
//  Copyright © 2021 The App Experts. All rights reserved.
//

import Foundation

class ViewModel {
    var accountsList:AccountList
    
    init() {
        self.accountsList = AccountList(accounts: [Account]())
    }

}
