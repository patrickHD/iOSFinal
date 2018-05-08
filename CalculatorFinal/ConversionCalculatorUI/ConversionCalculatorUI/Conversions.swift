//
//  Conversions.swift
//  ConversionCalculatorUI
//
//  Created by Pat on 4/13/18.
//  Copyright © 2018 Mizzou. All rights reserved.
//

import Foundation

struct Conversions{
    var inputUnit: String
    var outputUnit: String
    
    var label: String{
        get {
            return inputUnit + " to " + outputUnit
        }
    }
}
