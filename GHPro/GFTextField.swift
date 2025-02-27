//
//  GFTextField.swift
//  GHPro
//
//  Created by Swayam Rustagi on 17/07/24.
//

import UIKit

class GFTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    
    required init?(coder: NSCoder) { //Used for passing the some particularly important values.
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 15
        layer.borderWidth = 2
        layer.borderColor  = UIColor.systemGray5.cgColor
        textColor = .label //This will be basically black on light mode and white in dark mode
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        returnKeyType = .go
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        placeholder = "Enter Username"
    }
    
}
