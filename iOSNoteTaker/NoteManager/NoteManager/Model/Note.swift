//
//  Note.swift
//  NoteManager
//
//  Created by Pat on 4/27/18.
//  Copyright © 2018 Mizzou. All rights reserved.
//

import Foundation

struct Note {
    let notetype: NoteType
    let title: String
    let content: String
    let date: Date
    
    init(notetype: NoteType, title: String, content: String, date: Date){
        self.notetype = notetype
        self.title = title
        self.content = content
        self.date = date
    }
    
    init?(notetype:String, title:String, content:String, date:Date){
        if let notetype = NoteType(rawValue: notetype){
            self.init(notetype: notetype, title: title, content: content, date: date)
        }else{
            return nil
        }
    }
}
