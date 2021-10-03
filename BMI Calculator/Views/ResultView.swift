//
//  ResultView.swift
//  BMI Calculator
//
//  Created by Masood Zafar on 30.09.2021.
//

import UIKit

class ResultView : UIView {
    
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
    private let titleLabel: UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.text = "YOUR RESULT IS"
        titleLabel.font = UIFont(name: "Futura", size: 25)
        titleLabel.textColor = UIColor.BMIApp.secondColor

        return titleLabel
    }()
    
    //Initializing and configuring result text
    private var resultLabel: UILabel = {
        
        let resultLabel = UILabel()
        resultLabel.text = "0.0"
        resultLabel.font = UIFont(name: "Avenir Medium", size: 50)
        resultLabel.textColor = UIColor.BMIApp.thirdColor
        
        return resultLabel
    }()
    
    //Initializing and configuring weight label
    private var messageLabel: UILabel = {
        
        let messageLabel = UILabel()
        messageLabel.text = "No Advice."
        messageLabel.font = UIFont(name: "Avenir Medium", size: 17.5)
        messageLabel.textColor = UIColor.BMIApp.thirdColor
        
        return messageLabel
    }()
    
    //Initializing and configuring return button
    private let returnButton: UIButton = {
        
        let returnButton = UIButton(type: .system)
        returnButton.layer.cornerRadius = 6.0
        returnButton.backgroundColor = UIColor.BMIApp.backgroundColor
        returnButton.setTitleColor(UIColor.BMIApp.thirdColor, for: .normal)
        returnButton.setTitle("RETURN", for: .normal)
        returnButton.addTarget(self, action: #selector(ResultViewController.buttonTapped), for: .touchUpInside)
        
        return returnButton
    }()
    
    /* --------------------- Adding constraints --------------------- */
    
    private func labelConstraints(object: UILabel, constant: CGFloat) {
        object.translatesAutoresizingMaskIntoConstraints = false
        object.centerXAnchor.constraint(equalTo: self.layoutMarginsGuide.centerXAnchor).isActive =  true
        object.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: constant).isActive = true
    }
    
    private func returnButtonConstraint() {
        returnButton.translatesAutoresizingMaskIntoConstraints = false
        returnButton.centerXAnchor.constraint(equalTo: self.layoutMarginsGuide.centerXAnchor).isActive =  true
        returnButton.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: -10).isActive = true
        returnButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        returnButton.widthAnchor.constraint(equalTo: self.layoutMarginsGuide.widthAnchor).isActive = true
    }
    
    /* --------------------- Methods of the class --------------------- */
    
    //function to add as subview
    private func setupViews() {
        self.addSubview(titleLabel)
        self.addSubview(resultLabel)
        self.addSubview(messageLabel)
        self.addSubview(resultLabel)
        self.addSubview(returnButton)
    }
    
    //function to add constraints
    private func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        labelConstraints(object: titleLabel, constant: 100)
        labelConstraints(object: resultLabel, constant: 150)
        labelConstraints(object: messageLabel, constant: 225)
        returnButtonConstraint()
    }
    
    func setBMI(result: String) {
        self.resultLabel.text = result
    }
    
    func setMessage(message: String) {
        self.messageLabel.text = message
    }
}
