//
//  JsonFileLoader.swift
//  SecondCEPTDD
//
//  Created by The App Experts on 25/01/2021.
//  Copyright © 2021 The App Experts. All rights reserved.
//

import Foundation

class JsonFileLoader {
    private(set) var decoder: JSONDecoder?
    
    init(decoder: JSONDecoder) {
        self.decoder = decoder
        self.decoder?.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func getLocalURL (fromFile fName:String?, withExtension eName:String?) -> URL? {
        guard let url = Bundle.main.url(forResource: fName, withExtension: eName) else {return nil}
        return url
    }
    
    func getRemoteURL ( scheme:String?, host:String?, path:String?) -> URL?{
        var components = URLComponents()
        guard let scheme = scheme, !scheme.isEmpty else {return nil}
        guard let host = host, !host.isEmpty else {return nil}
        guard let path = path, !path.isEmpty else {return nil}

        components.scheme = scheme
        components.host = host
        components.path = path

        guard let url = components.url else {return nil}
        return !url.absoluteString.isEmpty ? url : nil
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
