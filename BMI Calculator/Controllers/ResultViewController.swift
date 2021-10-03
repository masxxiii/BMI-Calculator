//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Masood Zafar on 30.09.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    //Instances
    var resultView: ResultView { return self.view as! ResultView }
    
    //properties
    var bmiValue: String? , message: String? , color: UIColor?
    
    //Do additional setup after the view has been loaded
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //take a view and set it to the viewController's superview
    override func loadView() {
        self.view = ResultView(frame: UIScreen.main.bounds)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resultView.setBMI(result: bmiValue ?? "0.0")
        resultView.setMessage(message: message ?? "No Advice.")
        resultView.backgroundColor = color ?? .white
    }
    
    @objc func buttonTapped(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
