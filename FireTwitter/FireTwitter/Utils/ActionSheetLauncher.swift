//
//  ActionSheetLauncher.swift
//  FireTwitter
//
//  Created by 천지운 on 2020/07/07.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import Foundation

class ActionSheetLauncher: NSObject {
    
    // MARK: - Properties
    
    private let user: User
    
    // MARK: - LifeCycle
    
    init(user: User) {
        self.user = user
        super.init()
    }
    
    // MARK: - Helpers
    
    func show() {
        print("DEBUG: ActionSheet Show(\(user.username))")
    }
}
