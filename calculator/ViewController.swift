//
//  ViewController.swift
//  calculator
//
//  Created by Gouthami Reddy on 6/1/18.
//  Copyright © 2018 Gouthami Reddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var performingMath = false
    var operation = 0

    @IBOutlet weak var displayScreen: UILabel!
    
    @IBAction func numbers(_ sender: Any) {
        if performingMath == true {
            displayScreen.text = String((sender as AnyObject).tag-1)
            numberOnScreen = Double(displayScreen.text!)!
            performingMath = false
        } else {
            displayScreen.text = displayScreen.text! + String((sender as AnyObject).tag-1)
            numberOnScreen = Double(displayScreen.text!)!
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
}
    
    @IBAction func operation(_ sender: Any) {
        if displayScreen.text != "" && (sender as AnyObject).tag != 11 && (sender as AnyObject).tag != 16 {
            previousNumber = Double(displayScreen.text!)!
            if (sender as AnyObject).tag == 12 {
                displayScreen.text = "/"
            }
            if (sender as AnyObject).tag == 13 {
                displayScreen.text = "*"
            }
            if (sender as AnyObject).tag == 14 {
                displayScreen.text = "-"
            }
            if (sender as AnyObject).tag == 15 {
                displayScreen.text = "+"
            }
            
            operation = (sender as AnyObject).tag
            performingMath = true
        }
          else  if (sender as AnyObject).tag == 16 {
            if operation == 12 {
                displayScreen.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13 {
                displayScreen.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14 {
                displayScreen.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15 {
                displayScreen.text = String(previousNumber + numberOnScreen)
            }
            }
        else if (sender as AnyObject).tag == 11 {
            displayScreen.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
    }
    
}
