//
//  ViewController.swift
//  UIKit-maraphone-2
//
//  Created by Surgeont on 05.07.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let firstButton = createCustomButtonWith(text: "First Button")
        let secondButton = createCustomButtonWith(text: "Second Medium Button")
        let thirdButton = createCustomButtonWith(text: "Third")
        
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
        
        NSLayoutConstraint.activate([
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        ])
        
        NSLayoutConstraint.activate([
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 20)
        ])
        
        thirdButton.addTarget(self, action: #selector(tapThirdButton), for: .touchUpInside)
        
    }
    
    @objc func tapThirdButton() {
        let newViewController = SecondViewController()
        newViewController.modalPresentationStyle = .automatic
        present(newViewController, animated: true)
    }
    
    private func createCustomButtonWith(text: String) -> UIButton {
        let button = CustomButton()
        button.setTitle(text, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}

