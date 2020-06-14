//
//  OptionsViewController.swift
//  myTippy
//
//  Created by Dinaol Melak on 6/13/20.
//  Copyright © 2020 Dinaol Melak. All rights reserved.
//

import UIKit

class OptionsViewController: UIViewController {

    
    var color = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    @IBOutlet weak var colorOptionLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var colorSwitcher: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        setColor()
        
        // Do any additional setup after loading the view.
        resetButton.center.y += view.bounds.height
        colorOptionLabel.center.x -= self.view.bounds.width
        self.colorSwitcher.center.x += self.view.bounds.width
    }

    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.5) {
            self.colorOptionLabel.center.x += self.view.bounds.width
            self.colorSwitcher.center.x -= self.view.bounds.width
        }

        UIView.animate(withDuration: 0.6) {
            self.resetButton.center.y -= self.view.bounds.height
        }
        
    }
    @IBAction func tapSwitch(_ sender: Any) {
        if colorSwitcher.selectedSegmentIndex == 0{
            let selectedcolor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            view.backgroundColor = selectedcolor
            UserDefaults.standard.set(0, forKey: "color")
        }else if colorSwitcher.selectedSegmentIndex == 1{
            view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            UserDefaults.standard.set(1, forKey: "color")
        }else if colorSwitcher.selectedSegmentIndex == 2{
            view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            UserDefaults.standard.set(2, forKey: "color")
        }else if colorSwitcher.selectedSegmentIndex == 3{
            view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            UserDefaults.standard.set(3, forKey: "color")
        }
        
        UserDefaults.standard.set(true, forKey: "switchedColor")
    }
    
    @IBAction func didTapReset(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "switchedColor")
        UserDefaults.standard.set(3, forKey: "color")
        colorSwitcher.selectedSegmentIndex = 3
        setColor()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    func setColor(){
       colorSwitcher.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "color")
       if colorSwitcher.selectedSegmentIndex == 0{
           let selectedcolor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
           view.backgroundColor = selectedcolor
           
       }else if colorSwitcher.selectedSegmentIndex == 1{
           view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
           
       }else if colorSwitcher.selectedSegmentIndex == 2{
           view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
       }else if colorSwitcher.selectedSegmentIndex == 3{
           view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
       }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    
}
