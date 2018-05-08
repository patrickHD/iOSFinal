//
//  ConverterViewController.swift
//  ConversionCalculatorUI
//
//  Created by Pat on 4/13/18.
//
// ==Please press clear first before entering numbers==
//
//  Copyright © 2018 Mizzou. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    var converters = [Conversions]()
    
    var currentCnvrt = 0
    
    let alert = UIAlertController(title: "Select Option", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
    
    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        converters =
        [
            Conversions(inputUnit: "°F", outputUnit: "°C"),
            Conversions(inputUnit: "°C", outputUnit: "°F"),
            Conversions(inputUnit: "mi", outputUnit: "km"),
            Conversions(inputUnit: "km", outputUnit: "mi")
        ]
        
        for (index, converter) in converters.enumerated() {
            alert.addAction(UIAlertAction(title: converter.label, style: .default, handler: {
                (alertAction) -> Void in
                self.currentCnvrt = index
                self.inputDisplay.placeholder = converter.inputUnit
                self.outputDisplay.placeholder = converter.outputUnit
                self.updateText()
            }))
        }
        
        inputDisplay.placeholder = converters[0].inputUnit
        outputDisplay.placeholder = converters[0].outputUnit

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func convtPress(_ sender: UIButton) {
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func clrPress(_ sender: UIButton) {
        inputDisplay.text = nil
        outputDisplay.text = nil
    }
    
    @IBAction func pnegPress() {
        if let text = inputDisplay.text,
            var inputAsDouble = Double(text) {
            inputAsDouble *= -1
            inputDisplay.text = "\(inputAsDouble)"
            updateText()
        } else {
            inputDisplay.text = "-"
            outputDisplay.text = "-"
        }
    }
    
    @IBAction func numPress(_ sender: UIButton) {
        inputDisplay.text?.append(sender.currentTitle!)
        updateText()
    }
    
    func milesToKilometers(_ miles: Double) -> Double {
        return 1.61 * miles
    }
    
    func kilometersToMiles(_ kilometers: Double) -> Double {
        return 0.62 * kilometers
    }
    
    func cToF(_ celcius: Double) -> Double {
        return celcius * (9/5) + 32
    }
    
    func fToC(_ fahrenheit: Double) -> Double {
        return (fahrenheit - 32) * (5/9)
    }
    
    func updateText() {
        
        if let text = inputDisplay.text,
            let input = Double(text) {
            
            var output: Double
            
            switch currentCnvrt {
            case 0:
                output = fToC(input)
            case 1:
                output = cToF(input)
            case 2:
                output = milesToKilometers(input)
            case 3:
                output = kilometersToMiles(input)
            default:
                return
            }
            outputDisplay.text = "\(output)"
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
