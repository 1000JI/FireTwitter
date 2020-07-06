//
//  TweetHeader.swift
//  FireTwitter
//
//  Created by 천지운 on 2020/07/06.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class TweetHeader: UICollectionReusableView {
    
    // MARK: - Properties
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemPurple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    
}
