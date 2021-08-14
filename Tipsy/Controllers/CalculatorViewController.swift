//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tips = 0.10
    var splits = 2
    var billTotal = 0.0
    var formattedBillTotal = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        billTextField.endEditing(true);
        
        sender.isSelected = true
        let buttonTitle = sender.currentTitle ?? "0%"
        let buttonValue = Double(buttonTitle.dropLast())!
        
        tips = buttonValue / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splits = Int(sender.value)
        splitNumberLabel.text = String(splits)
        print(splits);
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(billTextField.text!)
        billTotal = (Double(billTextField.text!)! * (1 + tips)) / Double(splits)
        formattedBillTotal = String(format: "%.2f", billTotal)
        
        print("Total: " + formattedBillTotal)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.totalResult = formattedBillTotal
            destinationVC.splits = splits
            destinationVC.tips = tips
        }
    }
}

