//
//  NotificationService.swift
//  FireTwitter
//
//  Created by 천지운 on 2020/07/08.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import Firebase

struct NotificationService {
    static let shared = NotificationService()
    private init() { }
    
    func uploadNotification(type: NotificationType,
                            tweet: Tweet? = nil,
                            user: User? = nil) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        var values: [String: Any] = ["timestamp": Int(NSDate().timeIntervalSince1970),
                                     "uid": uid,
                                     "type": type.rawValue]
        
        if let tweet = tweet {
            values["tweetID"] = tweet.tweetID
            REF_NOTIFICATIONS.child(tweet.user.uid).childByAutoId().updateChildValues(values)
        } else if let user = user {
            REF_NOTIFICATIONS.child(user.uid).childByAutoId().updateChildValues(values)
        }
    }
}
