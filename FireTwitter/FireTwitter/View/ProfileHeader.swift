//
//  ProfileHeader.swift
//  FireTwitter
//
//  Created by 천지운 on 2020/07/03.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class ProfileHeader: UICollectionReusableView {
    
    // MARK: - Properties
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    
}
