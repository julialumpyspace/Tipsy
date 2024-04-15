//
//  ViewController.swift
//  Tipsy
//
//  Created by Yuliia Vorobei on 13.03.2024.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var billTotalField: UITextField!
    @IBOutlet weak var tipSegment: UISegmentedControl!
    @IBOutlet weak var tipTotalLabel: UILabel!
    @IBOutlet weak var splitStepper: UIStepper!
    @IBOutlet weak var splitStepperLabel: UILabel!
    
    let tipBrain = TipBrain()
    let resultViewID = "goToResult"
    var tipPercentage: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tipSegmentChanged(_ sender: UISegmentedControl) {
        let selectedTipIndex = sender.selectedSegmentIndex
        let selectedTipTitle = tipSegment.titleForSegment(at: selectedTipIndex)!
        let selectedTipTitleArr: [String] = selectedTipTitle.components(separatedBy: "%")
        
        let tip: Int = Int(selectedTipTitleArr[0])!
        tipPercentage = tip
        
        let billTotal: Float = Float(billTotalField.text!) ?? 0.0
        let tipTotal = tipBrain.getTipTotal(billTotal: billTotal, tipPercentage: tip)
        
        tipTotalLabel.text = "+" + String(format: "%.1f", tipTotal)
    }
    
    @IBAction func splitStepperChanged(_ sender: UIStepper) {
        splitStepperLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: resultViewID, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == resultViewID {
            let destinationVC = segue.destination as! TotalViewController
            destinationVC.billTotal = Float(billTotalField.text!) ?? 0.0
            destinationVC.tipPercentage = tipPercentage
            destinationVC.splitCount = Int(splitStepperLabel.text!) ?? 0
        }
    }
}

