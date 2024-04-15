//
//  TotalViewController.swift
//  Tipsy
//
//  Created by Yuliia Vorobei on 14.03.2024.
//

import UIKit

class TotalViewController: UIViewController {
    var billTotal: Float = 0.0
    var tipPercentage: Int = 0
    var splitCount: Int = 1
    
    let tipBrain = TipBrain()
    
    @IBOutlet weak var totalSplitLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let splitTotal = tipBrain.getSplitTotal(billTotal, tipPercentage, splitCount)
        totalSplitLabel.text = String(format: "%.1f", splitTotal)
        descriptionLabel.text = "Split between \(splitCount) people, with \(tipPercentage)% tip."
    }

    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
