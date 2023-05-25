//
//  AuthService.swift
//  InstagramFirestroreTutorial
//
//  Created by escher on 2023/05/15.
//

import Foundation
import Firebase

struct AuthCredentials {
    let email: String
    let password: String
    let fullname: String
    let username: String
    let profileImage: UIImage
}

struct AuthService {
    static func logUserIn(withEmail email: String, password: String, completion:  @escaping(AuthDataResult?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    static func registerUser(withCredential credentials: AuthCredentials, completion: @escaping(Error?) -> Void) {
        Imageuploader.uploadImage(image: credentials.profileImage) { imageUrl in
            Auth.auth().createUser(withEmail: credentials.email, password: credentials.password) {
                (result, error) in
                if let error = error {
                    print("DEBUG: Failed to register user \(error.localizedDescription)")
                    return
                }
                
                guard let uid = result?.user.uid else { return }
                let data: [String: Any] = [
                    "email": credentials.email,
                    "fullname": credentials.fullname,
                    "profileImageUrl": imageUrl,
                    "uid": uid,
                    "username": credentials.username
                ]
                
                COLLECTION_USERS.document(uid).setData(data, completion: completion)
            }
        }
        print("DEBUG: Vredentials are \(credentials)")
    }
    
    static func resetPassword(withEmail email: String, completion: @escaping(Error?) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email, completion: completion)
    }
}
