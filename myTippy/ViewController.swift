//
//  ViewController.swift
//  myTippy
//
//  Created by Dinaol Melak on 2/20/20.
//  Copyright © 2020 Dinaol Melak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var color = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let check = UserDefaults.standard.bool(forKey: "switchedColor")
        if check == false{
            UserDefaults.standard.set(3, forKey: "color")
        }
        
        setColor()
    }
    override func viewWillAppear(_ animated: Bool) {
        setColor()
        textField.becomeFirstResponder()
    }
//    override func viewDidAppear(_ animated: Bool) {
//        setColor()
//    }

    @IBAction func calculated(_ sender: Any) {
        // get the data
        let bill = Double(textField.text!) ?? 0.00
        // calculate the tip
        let tipPercent = [0.15, 0.18, 0.2]
        let tip = bill * tipPercent[segmentControl.selectedSegmentIndex]
        let total = bill + tip
        //-----
        //var fv = 3534234.55
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2;
        //resultFV.text = formatter.stringFromNumber(fv) // result: $3,534,235 –
        //-----
        // display the tip
        tipLabel.text = formatter.string(from: NSNumber(value: tip))
        totalLabel.text = formatter.string(from: NSNumber(value: total))
    }
    @IBAction func didTapOptions(_ sender: Any) {
        performSegue(withIdentifier: "settingsSegue", sender: self)
        
        
        
    }
    
    func setColor(){
        let storedColor = UserDefaults.standard.integer(forKey: "color")
        if storedColor == 0{
            view.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            
        }else if storedColor == 1{
            view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            
        }else if storedColor == 2{
            view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            
        }else if storedColor == 3{
            view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
}
