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
        
        let ref = REF_TWEETS.childByAutoId()
        
        ref.updateChildValues(values) { (err, ref) in
            // update user-tweet structure after tweet upload completes
            guard let tweetID = ref.key else { return }
            REF_USER_TWEETS.child(uid).updateChildValues([tweetID: 1], withCompletionBlock: completion)
        }
    }
    
    func fetchTweets(completion: @escaping([Tweet]) -> Void) {
        var tweets = [Tweet]()
        
        REF_TWEETS.observe(.childAdded) { snapshot in
            guard let dictionary = snapshot.value as? [String : Any] else { return }
            guard let uid = dictionary["uid"] as? String else { return }
            let tweetID = snapshot.key
            
            UserService.shared.fetchUser(uid: uid) { user in
                let tweet = Tweet(user: user, tweetID: tweetID, dictionary: dictionary)
                tweets.append(tweet)
                completion(tweets)
            }
        }
    }
}
