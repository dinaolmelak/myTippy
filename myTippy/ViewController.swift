//
//  ViewController.swift
//  myTippy
//
//  Created by Dinaol Melak on 2/20/20.
//  Copyright © 2020 Dinaol Melak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculated(_ sender: Any) {
        // get the data
        let bill = Double(textField.text!) ?? 0
        // calculate the tip
        let tipPercent = [0.15, 0.18, 0.2]
        let tip = bill * tipPercent[segmentControl.selectedSegmentIndex]
        let total = bill + tip
        
        // display the tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f",total)
    }
    
}

