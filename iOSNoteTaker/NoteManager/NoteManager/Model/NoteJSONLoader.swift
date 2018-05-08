//
//  NoteJSONLoader.swift
//  NoteManager
//
//  Created by Pat on 4/27/18.
//  Copyright © 2018 Mizzou. All rights reserved.
//

import Foundation

class NoteJSONLoader{
    class func load(fileName: String) -> [Note]{
        var events = [Note]()
        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)){
            events = NoteJSONParser.parse(data)
        }
        return events
    }
}
