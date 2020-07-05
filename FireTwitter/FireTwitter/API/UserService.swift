//
//  UserService.swift
//  FireTwitter
//
//  Created by 천지운 on 2020/07/01.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import Firebase

struct UserService {
    static let shared = UserService()
    private init() { }
    
    func fetchUser(uid: String, completion: @escaping(User) -> Void) {
        /*
         * 값 이벤트 수신 대기
            - 경로의 데이터를 읽고 변경사항을 수신 대기 하려면 observeSingleEvent 메서드의 이벤트를 관찰한다.
            - 하위 요소가 변경될 때 마다 다시 호출되며, 해당 데이터는 snapshot으로 전달된다.
            - 데이터가 없으면 nil을 반환한다.
         */
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot in
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            
            let user = User(uid: uid, dictionary: dictionary)
            completion(user)
        }
    }
    
    func fetchUsers(completion: @escaping([User]) -> Void) {
        var users = [User]()
        REF_USERS.observe(.childAdded) { snapshot in
            let uid = snapshot.key
            guard let dictionary = snapshot.value as? [String : Any] else { return }
            let user = User(uid: uid, dictionary: dictionary)
            users.append(user)
            completion(users)
        }
    }
    
    func followUser(uid: String, completion: @escaping(Error?, DatabaseReference) -> Void) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        REF_USER_FOLLOWING.child(currentUid).updateChildValues([uid: 1]) { (err, ref) in
            REF_USER_FOLLOWERS.child(uid).updateChildValues([currentUid: 1], withCompletionBlock: completion)
        }
    }
}
