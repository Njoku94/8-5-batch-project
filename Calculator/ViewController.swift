//
//  ViewController.swift
//  Calculator
//
//  Created by MCS on 8/7/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen: Double = 0
    var  previousNumber: Double = 0
    var performingMath = false
    var operation = 0
    
    @IBOutlet weak var Label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if performingMath  == true {
            Label.text = String(sender.tag-1)
            numberOnScreen = Double(Label.text!)!
            performingMath = false
        }
        else {
            Label.text = Label.text! + String(sender.tag-1)
            numberOnScreen = Double(Label.text!)!
        }
    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
        if Label.text != "" && sender.tag != 11 && sender.tag != 16{
            
            previousNumber = Double(Label.text!)!
            
            if sender.tag == 12{ // Divide
                Label.text = "/"
            }
            else if sender.tag == 13{ // Multply
                Label.text = "x"
            }
            else if sender.tag == 14{ // Subtract
                Label.text = "-"
            }
            else if sender.tag == 15{ // Addition
                Label.text = "+"
            }
            
            operation = sender.tag
            performingMath = true
        }
        else if sender.tag == 16{
            if operation == 12{
                Label.text = String(previousNumber / numberOnScreen)
            }
            if operation == 13{
                Label.text = String(previousNumber * numberOnScreen)
            }
            if operation == 14{
                Label.text = String(previousNumber - numberOnScreen)
            }
            if operation == 15{
                Label.text = String(previousNumber + numberOnScreen)
            }
        }
        else if sender.tag == 11{
            Label.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

