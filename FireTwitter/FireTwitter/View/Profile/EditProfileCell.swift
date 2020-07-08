//
//  EditProfileCell.swift
//  FireTwitter
//
//  Created by 천지운 on 2020/07/08.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

protocol EditProfileCellDelegate: class {
    func updateUserInfo(_ cell: EditProfileCell)
}

class EditProfileCell: UITableViewCell {
    
    // MARK: - Properties
    
    weak var delegate: EditProfileCellDelegate?
    
    var viewModel: EditProfileViewModel? {
        didSet { configure() }
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    lazy var infoTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.font = .systemFont(ofSize: 14)
        tf.textAlignment = .left
        tf.textColor = .twitterBlue
        tf.addTarget(self, action: #selector(handleUpdateUserInfo), for: .editingDidEnd)
        tf.text = "Test User Attribute"
        return tf
    }()
    
    let bioTextView: UITextView = {
        let tv = UITextView()
        tv.font = .systemFont(ofSize: 14)
        tv.textColor = .twitterBlue
//        tv.placeholderLabel.text = "Bio"
        return tv
    }()
    
    
    // MARK: - LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        addSubview(titleLabel)
        titleLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, paddingTop: 12, paddingLeading: 16)
        
        addSubview(infoTextField)
        infoTextField.anchor(top: topAnchor, leading: titleLabel.trailingAnchor,
                             bottom: bottomAnchor, trailing: trailingAnchor,
                             paddingTop: 4, paddingLeading: 16, paddingTrailing: 8)
        
        addSubview(bioTextView)
        bioTextView.anchor(top: topAnchor, leading: titleLabel.trailingAnchor,
                           bottom: bottomAnchor, trailing: trailingAnchor,
                           paddingTop: 4, paddingLeading: 16, paddingTrailing: 8)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func handleUpdateUserInfo() {
        delegate?.updateUserInfo(self)
    }
    
    // MARK: - Helpers
    
    func configure() {
        guard let viewModel = viewModel else { return }
        
        infoTextField.isHidden = viewModel.shouldHideTextField
        bioTextView.isHidden = viewModel.shouldHideTextField
        
        titleLabel.text = viewModel.titleText
        
        infoTextField.text = viewModel.optionValue
        bioTextView.text = viewModel.optionValue
    }
    
}
