//
//  LoginController.swift
//  FireTwitter
//
//  Created by 천지운 on 2020/06/30.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    // MARK: - Properties
    
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "TwitterLogo")
        return iv
    }()
    
    private lazy var emailContrainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "mail")
        
        view.addSubview(iv)
        iv.anchor(leading: view.leadingAnchor, bottom: view.bottomAnchor,
                  paddingLeading: 8, paddingBottom: 8)
        iv.setDimensions(width: 24, height: 24)
        
        return view
    }()
    
    private lazy var passwordContrainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPurple
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "ic_lock_outline_white_2x")
        
        view.addSubview(iv)
        iv.anchor(leading: view.leadingAnchor, bottom: view.bottomAnchor,
                  paddingLeading: 8, paddingBottom: 8)
        iv.setDimensions(width: 24, height: 24)
        
        return view
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(logoImageView)
        logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        logoImageView.setDimensions(width: 150, height: 150)
        logoImageView.layer.cornerRadius = 150 / 2
        
        let stack = UIStackView(arrangedSubviews: [emailContrainerView, passwordContrainerView])
        stack.axis = .vertical
        stack.spacing = 8
        
        view.addSubview(stack)
        stack.anchor(top: logoImageView.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor)
    }
    
}
