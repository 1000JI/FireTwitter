//
//  TweetService.swift
//  FireTwitter
//
//  Created by 천지운 on 2020/07/01.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import Firebase

struct TweetService {
    static let shared = TweetService()
    private init() { }
    
    func uploadTweet(caption: String, completion: @escaping(Error?, DatabaseReference) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let values = [
            "uid": uid,
            "timestamp": Int(NSDate().timeIntervalSince1970),
            "caption": caption,
            "likes": 0,
            "retweets": 0
        ] as [String : Any]
        
        REF_TWEETS.childByAutoId().updateChildValues(values, withCompletionBlock: completion)
    }
}
