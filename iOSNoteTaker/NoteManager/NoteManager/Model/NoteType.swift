//
//  NoteType.swift
//  NoteManager
//
//  Created by Pat on 4/27/18.
//  Copyright © 2018 Mizzou. All rights reserved.
//

import UIKit

enum NoteType: String{
    case general
    case list
    case school
    
    var image: UIImage? {
        return UIImage(named: self.rawValue + "Icon")
    }
}
