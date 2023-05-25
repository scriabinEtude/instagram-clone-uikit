//
//  CustomTextField.swift
//  InstagramFirestroreTutorial
//
//  Created by escher on 2023/05/12.
//

import UIKit

class CustomTextField: UITextField {
    init(placeholder: String){
        super.init(frame: .zero)
        
        let spacer = UIView()
        spacer.setDimensions(height: 50, width: 12)
        leftView = spacer
        leftViewMode = .always
        
        borderStyle = .none
        textColor = .white
        keyboardAppearance = .dark
        keyboardType = .emailAddress
        backgroundColor = UIColor(white: 1, alpha: 0.1)
        setHeight(50)
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor:UIColor(white: 1, alpha: 0.7)])
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
