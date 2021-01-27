//
//  JsonFileLoader.swift
//  SecondCEPTDD
//
//  Created by The App Experts on 25/01/2021.
//  Copyright © 2021 The App Experts. All rights reserved.
//

import Foundation

class JsonFileLoader {
    var decoder: JSONDecoder?
    
    init(decoder: JSONDecoder) {
        self.decoder = decoder
    }
    
    func getLocalURL (fromFile fName:String?, withExtension eName:String?) -> URL? {
        guard let url = Bundle.main.url(forResource: fName, withExtension: eName) else {return nil}
        return url
    }
    
    func getData (from url:URL) -> Data? {
        guard let data = try? Data(contentsOf: url) else {return nil}
        return data
    }
    
    func fetch(from data: Data?) -> [Account]? {
        guard let data = data else {return nil}
        guard let json = try? self.decoder?.decode([Account].self, from: data) else { return nil}
        return json
    }
    
}
