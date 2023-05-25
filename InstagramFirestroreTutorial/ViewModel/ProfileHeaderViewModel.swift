//
//  ProfileHeaderViewModel.swift
//  InstagramFirestroreTutorial
//
//  Created by escher on 2023/05/16.
//

import UIKit

struct ProfileHeaderViewModel {
    let user: User
    
    var fullname: String {
        return user.fullname
    }
    
    var profileImageUrl: URL? {
        return URL(string: user.profileImageUrl)
    }
    
    var followButtonText: String {
        if user.isCurrentUser {
            return "Edit Profile"
        }
        
        return user.isFollowed ? "Following" : "Followed"
    }
    
    var followButtonBackgroundColor: UIColor {
        return user.isCurrentUser ? .white : .systemBlue
    }
    
    var followButtonTextColor: UIColor {
        return user.isCurrentUser ? .black : .white
    }
    
    var numbersOfFollowers: NSAttributedString {
        return attributedStatText(value: user.stats.followers, label: "followers")
    }
    
    var numbersOfFollowing: NSAttributedString {
        return attributedStatText(value: user.stats.follwing, label: "follwing")
    }
    
    var numberOfPosts: NSAttributedString {
        return attributedStatText(value: user.stats.posts, label: "posts")
    }
    
    init(user: User){
        self.user = user
    }
    
    func attributedStatText(value: Int, label: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: "\(value)\n", attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        attributedText.append(NSAttributedString(string: label, attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.lightGray]))
        
        return attributedText
    }
}
