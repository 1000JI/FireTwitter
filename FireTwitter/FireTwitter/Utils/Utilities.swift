//
//  Utilities.swift
//  FireTwitter
//
//  Created by 천지운 on 2020/06/30.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class Utilities {
    
    func inputContrainerView(withImage image: UIImage, textField: UITextField) -> UIView {
        let view = UIView()
        let iv = UIImageView()
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        iv.image = image
        view.addSubview(iv)
        iv.anchor(leading: view.leadingAnchor, bottom: view.bottomAnchor,
                  paddingLeading: 8, paddingBottom: 8)
        iv.setDimensions(width: 24, height: 24)
        
        view.addSubview(textField)
        textField.anchor(leading: iv.trailingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor,
                         paddingLeading: 8, paddingBottom: 8)
        
        let dividerView = UIView()
        dividerView.backgroundColor = .white
        view.addSubview(dividerView)
        dividerView.anchor(leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor,
                           paddingLeading: 8, height: 0.75)
        return view
    }
    
    func textField(withPlaceholder placeholder: String) -> UITextField {
        let tf = UITextField()
        tf.textColor = .white
        tf.font = .systemFont(ofSize: 16)
        tf.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return tf
    }
    
    func attributedButton(_ firstPart: String, _ secondPart: String) -> UIButton {
        let button = UIButton(type: .system)
        
        let attributedTitle = NSMutableAttributedString(
            string: firstPart,
            attributes: [
                NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
                NSMutableAttributedString.Key.foregroundColor: UIColor.white
            ]
        )
        
        attributedTitle.append(NSMutableAttributedString(
            string: secondPart,
            attributes: [
                NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
                NSMutableAttributedString.Key.foregroundColor: UIColor.white
            ]
        ))
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }
    
}
