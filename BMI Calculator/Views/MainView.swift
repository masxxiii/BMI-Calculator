//
//  MainView.swift
//  BMI Calculator
//
//  Created by Masood Zafar on 27.09.2021.
//

import UIKit

class MainView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.BMIApp.backgroundColor
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /* --------------------- Initializing UI objects --------------------- */
    
    //Initializing and configuring title text
    private let titleText: UILabel = {
        
        let titleText = UILabel()
        titleText.text = "CALCULATE YOUR BMI"
        titleText.font = UIFont(name: "Futura", size: 25)
        titleText.textColor = UIColor.BMIApp.secondColor

        return titleText
    }()
    
    //Initializing and configuring height label
    private let heightLabel: UILabel = {
        
        let heightLabel = UILabel()
        heightLabel.text = "Height"
        heightLabel.font = UIFont(name: "Avenir Medium", size: 17.5)
        heightLabel.textColor = UIColor.BMIApp.thirdColor
        
        return heightLabel
    }()
    
    //Initializing and configuring weight label
    private let weightLabel: UILabel = {
        
        let weightLabel = UILabel()
        weightLabel.text = "Weight"
        weightLabel.font = UIFont(name: "Avenir Medium", size: 17.5)
        weightLabel.textColor = UIColor.BMIApp.thirdColor
        
        return weightLabel
    }()
    
    //Initializing and configuring calculate button
    private let calculateButton: UIButton = {
        
        let calculatebutton = UIButton(type: .system)
        calculatebutton.layer.cornerRadius = 6.0
        calculatebutton.backgroundColor = UIColor.BMIApp.thirdColor
        calculatebutton.setTitleColor(UIColor.BMIApp.backgroundColor, for: .normal)
        calculatebutton.setTitle("CALCULATE", for: .normal)
        calculatebutton.addTarget(self, action: #selector(ViewController.buttonTapped), for: .touchUpInside)
        
        return calculatebutton
    }()
    
    //Initializing and configuring height number
    private var heightNumber: UILabel = {
        
        let heightNumber = UILabel()
        heightNumber.font = UIFont(name: "Avenir Medium", size: 17.5)
        heightNumber.textColor = UIColor.BMIApp.thirdColor
        heightNumber.text = "1.5"
        
        return heightNumber
    }()
    
    //Initializing and configuring weight number
    private var weightNumber: UILabel = {
        
        let weightNumber = UILabel()
        weightNumber.font = UIFont(name: "Avenir Medium", size: 17.5)
        weightNumber.textColor = UIColor.BMIApp.thirdColor
        weightNumber.text = "100.0"
        
        return weightNumber
    }()
    
    //Initializing and configuring height slider
    private var heightSlider: UISlider = {
        
        let heightSlider = UISlider()
        heightSlider.minimumValue = 0
        heightSlider.maximumValue = 3
        heightSlider.value = (heightSlider.minimumValue + heightSlider.maximumValue)/2
        heightSlider.isContinuous = true
        heightSlider.tintColor = UIColor.BMIApp.firstColor
        heightSlider.addTarget(self, action: #selector(ViewController.heightValueChanged), for: .valueChanged)
        
        return heightSlider
    }()
    
    //Initializing and configuring weight slider
    private var weightSlider: UISlider = {
        
        let weightSlider = UISlider()
        weightSlider.minimumValue = 0
        weightSlider.maximumValue = 200
        weightSlider.value = (weightSlider.minimumValue + weightSlider.maximumValue)/2
        weightSlider.isContinuous = true
        weightSlider.tintColor = UIColor.BMIApp.firstColor
        weightSlider.addTarget(self, action: #selector(ViewController.weightValueChanged), for: .valueChanged)
        
        return weightSlider
    }()
    
    /* --------------------- Adding constraints --------------------- */
    
    private func titleTextConstraint() {
        titleText.translatesAutoresizingMaskIntoConstraints = false
        titleText.centerXAnchor.constraint(equalTo: self.layoutMarginsGuide.centerXAnchor).isActive =  true
        titleText.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 50).isActive = true
    }
    
    private func calculateButtonConstraint() {
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.centerXAnchor.constraint(equalTo: self.layoutMarginsGuide.centerXAnchor).isActive =  true
        calculateButton.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: -10).isActive = true
        calculateButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        calculateButton.widthAnchor.constraint(equalTo: self.layoutMarginsGuide.widthAnchor).isActive = true
    }
    
    private func labelConstraintLeading(object: UILabel, constant: CGFloat) {
        object.translatesAutoresizingMaskIntoConstraints = false
        object.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor).isActive =  true
        object.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: constant).isActive = true
    }
    
    private func labelConstraintTrailing(object: UILabel, constant: CGFloat) {
        object.translatesAutoresizingMaskIntoConstraints = false
        object.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor).isActive =  true
        object.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: constant).isActive = true
    }
    
    private func sliderConstraint(object: UISlider, constant: CGFloat) {
        object.translatesAutoresizingMaskIntoConstraints = false
        object.centerXAnchor.constraint(equalTo: self.layoutMarginsGuide.centerXAnchor).isActive =  true
        object.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: constant).isActive = true
        object.widthAnchor.constraint(equalTo: self.layoutMarginsGuide.widthAnchor).isActive = true
    }
    
    /* --------------------- Methods of the class --------------------- */
    
    //function to add as subview
    private func setupViews() {
        
        self.addSubview(titleText)
        self.addSubview(heightLabel)
        self.addSubview(weightLabel)
        self.addSubview(calculateButton)
        self.addSubview(heightNumber)
        self.addSubview(weightNumber)
        self.addSubview(heightSlider)
        self.addSubview(weightSlider)
    }
    
    //function to add constraints
    private func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        titleTextConstraint()
        calculateButtonConstraint()
        labelConstraintLeading(object: heightLabel, constant: -250)
        labelConstraintLeading(object: weightLabel, constant: -150)
        labelConstraintTrailing(object: heightNumber, constant: -250)
        labelConstraintTrailing(object: weightNumber, constant: -150)
        sliderConstraint(object: heightSlider, constant: -200)
        sliderConstraint(object: weightSlider, constant: -100)
    }
    
    public func heightValueAssigned(input: Float) {
        self.heightNumber.text = String(format: "%.1f", input)
    }
    
    public func weightValueAssigned(input: Float) {
        self.weightNumber.text = String(format: "%.1f", input)
    }
}

//extension for UIColor class to define custom UIColors
extension UIColor {
    struct BMIApp {
        static var backgroundColor: UIColor { return UIColor(red: 1.00, green: 0.95, blue: 0.90, alpha: 1.00) }
        static var firstColor: UIColor { return UIColor(red: 0.98, green: 0.84, blue: 0.65, alpha: 1.00) }
        static var secondColor: UIColor { return UIColor(red: 1.00, green: 0.69, blue: 0.52, alpha: 1.00) }
        static var thirdColor: UIColor { return UIColor(red: 0.29, green: 0.40, blue: 0.53, alpha: 1.00) }
    }
}
