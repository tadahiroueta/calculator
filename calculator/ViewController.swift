//
//  ViewController.swift
//  calculator
//
//  Created by Ueta, Lucas T on 11/7/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        // everything
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .trailing
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stack.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
        ])
        
        // number
        let label = UILabel()
        label.text = "0"

        label.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(label)
        NSLayoutConstraint.activate([
            label.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // all buttons
        let buttons = UIStackView()
        buttons.axis = .vertical
        buttons.distribution = .fillEqually
        buttons.spacing = 1
        
        buttons.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(buttons)
        NSLayoutConstraint.activate([
            buttons.widthAnchor.constraint(equalTo: stack.widthAnchor)
        ])
        
        buttons.addArrangedSubview(getRow([
            getButton(text: "Clear", color: .darkGray),
            getButton(text: "+/-", color: .darkGray),
            getButton(text: "%", color: .darkGray),
            getButton(text: "+", color: .systemRed)
        ]))
        buttons.addArrangedSubview(getRow([
            getButton(text: "7", color: .systemGray),
            getButton(text: "8", color: .systemGray),
            getButton(text: "9", color: .systemGray),
            getButton(text: "x", color: .systemRed)
        ]))
        buttons.addArrangedSubview(getRow([
            getButton(text: "4", color: .systemGray),
            getButton(text: "5", color: .systemGray),
            getButton(text: "6", color: .systemGray),
            getButton(text: "-", color: .systemRed)
        ]))
        buttons.addArrangedSubview(getRow([
            getButton(text: "1", color: .systemGray),
            getButton(text: "2", color: .systemGray),
            getButton(text: "3", color: .systemGray),
            getButton(text: "+", color: .systemRed)
        ]))
        
        // large button
        let zero = getButton(text: "0", color: .systemGray)
        let point = getButton(text: ".", color: .systemGray)
        let equal = getButton(text: "=", color: .systemRed)

        
        let bottom = getRow([
            zero,
            point,
            equal
        ])
        bottom.distribution = .fillProportionally
        
        buttons.addArrangedSubview(bottom)
        
        NSLayoutConstraint.activate([
            zero.widthAnchor.constraint(equalTo: point.widthAnchor, multiplier: 2),
            point.widthAnchor.constraint(equalTo: equal.widthAnchor)
        ])
    }
    
    func getRow(_ buttons :[UIButton]) -> UIStackView {
        let row = UIStackView()
        row.axis = .horizontal
        row.distribution = .fillEqually
        row.spacing = 1
        for button in buttons { row.addArrangedSubview(button) }
        return row
    }
    
    func getButton(text: String, color: UIColor) -> UIButton {
        let button = UIButton()
        button.backgroundColor = color
        button.setTitle(text, for: .normal)
        return button
    }
}

