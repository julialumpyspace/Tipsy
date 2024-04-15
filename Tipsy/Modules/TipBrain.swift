//
//  TipBrain.swift
//  Tipsy
//
//  Created by Yuliia Vorobei on 14.03.2024.
//

import Foundation

struct TipBrain {
    func getTipTotal (billTotal: Float, tipPercentage: Int) -> Float {
        return (billTotal * Float(tipPercentage)) / 100
    }
    
    func getSplitTotal(_ billTotal: Float, _ tipPercentage: Int, _ splitCount: Int ) -> Float {
        let tipTotal = self.getTipTotal(billTotal: billTotal, tipPercentage: tipPercentage)
        let splitTotal = (billTotal + tipTotal) / Float(splitCount)
        return splitTotal
    }
}
