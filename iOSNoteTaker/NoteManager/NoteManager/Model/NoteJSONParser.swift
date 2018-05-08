//
//  NoteJSONParser.swift
//  NoteManager
//
//  Created by Pat on 4/27/18.
//  Copyright © 2018 Mizzou. All rights reserved.
//

import Foundation

class NoteJSONParser{
    
    static let dateFormatter = DateFormatter()
    
    class func parse(_ data: Data) -> [Note] {
        var notelist = [Note]()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm"
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let root = json as? [String: Any],
            let status = root["status"] as? String,
            status == "ok" {
            if let notes = root["notes"] as? [Any]{
                for note in notes{
                    if let note = note as? [String: String]{
                        if let notetype = note["notetype"],
                            let title = note["title"],
                            let content = note["content"],
                            let dateString = note["date"],
                            let date = dateFormatter.date(from: dateString) {
                            
                            if let note = Note(notetype: notetype, title: title, content: content, date: date){
                                notelist.append(note)
                            }
                        }
                    }
                }
            }
        }
        return notelist
    }
}
