//
//  ProfileHeaderViewModel.swift
//  FireTwitter
//
//  Created by 천지운 on 2020/07/05.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import Foundation

enum ProfileFilterOptions: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var description: String {
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Tweets & Replies"
        case .likes: return "Likes"
        }
    }
}
