//
//  Calculator.swift
//  BMI Calculator
//
//  Created by Masood Zafar on 30.09.2021.
//

import UIKit

struct Calculator {
    
    var bmi: Data?
    
    func getBMIString() -> String {
        
        let bmiDecimal = String(format: "%.1f", bmi?.bmiValue ?? 0.0)
        return bmiDecimal
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice."
    }
    
    func getColor() -> UIColor {
        return bmi?.displayColor ?? UIColor.white
    }
    
    mutating func calculate(height: Float, weight: Float) {
        let valueCalculated = weight / (height * height)
        
        if valueCalculated < 18.5 {
            bmi = Data(bmiValue: valueCalculated,
                       advice: "The more you weigh, the harder you are to kidnap.",
                       displayColor: UIColor(red: 1.00, green: 0.94, blue: 0.47, alpha: 1.00))
        }
        else if valueCalculated < 24.9 {
            bmi = Data(bmiValue: valueCalculated,
                       advice: "You are fit as a fiddle.",
                       displayColor: UIColor(red: 0.50, green: 0.93, blue: 0.60, alpha: 1.00))
        }
        else {
            bmi = Data(bmiValue: valueCalculated,
                       advice: "You are fat. There is no other way to put it.",
                       displayColor: UIColor(red: 1.00, green: 0.28, blue: 0.28, alpha: 1.00))
        }
        
    }
}
