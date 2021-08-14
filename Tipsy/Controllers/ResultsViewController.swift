//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Shou-Chi Chang on 2021/8/8.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalResult = "0.0"
    var splits = 2
    var tips = 0.10
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = totalResult
        settingsLabel.text = "Split between \(splits) people, with \(Int(tips * 100))% tip"
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
