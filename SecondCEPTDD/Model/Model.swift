//
//  Model.swift
//  SecondCEPTDD
//
//  Created by The App Experts on 22/01/2021.
//  Copyright © 2021 The App Experts. All rights reserved.
//

import Foundation

struct Account {
    let kind:String?
    let balance:Double?
}

struct AccountList {
    var accounts: [Account]
    
    var isEmpty:Bool{
      return true
    }
    
    var count:Int {
        return 0
    }
}
