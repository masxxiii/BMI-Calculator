//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Masood Zafar on 20.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    //Instances
    var mainView: MainView { return self.view as! MainView }
    var BMICalulated = Calculator()
    var resultViewController = ResultViewController()
    
    //properties
    var heightValue: Float = 1.5 , weightValue: Float = 100.0
    
    //Do additional setup after the view has been loaded
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //take a view and set it to the viewController's superview
    override func loadView() {
        self.view = MainView(frame: UIScreen.main.bounds)
    }
    
    @objc func buttonTapped(sender: UIButton) {
        BMICalulated.calculate(height: heightValue, weight: weightValue)
        resultViewController.bmiValue = BMICalulated.getBMIString()
        resultViewController.message = BMICalulated.getAdvice()
        resultViewController.color = BMICalulated.getColor()
        self.present(resultViewController, animated: true, completion: nil)
    }
    
    @objc func heightValueChanged(sender: UISlider) {
        mainView.heightValueAssigned(input: sender.value)
        heightValue = sender.value
    }
    
    @objc func weightValueChanged(sender: UISlider) {
        mainView.weightValueAssigned(input: sender.value)
        weightValue = sender.value
    }
}
