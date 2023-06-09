//
//  PostViewModel.swift
//  InstagramFirestroreTutorial
//
//  Created by escher on 2023/05/18.
//

import UIKit

struct PostViewModel {
    var post: Post
    
    var imageUrl: URL? { return URL(string: post.imageUrl) }
    var userProfileImageUrl: URL? { return URL(string: post.ownerImageUrl) }
    var username: String { return post.ownerUsername }
    var caption: String { return post.caption }
    var likes: Int { return post.likes }
    var likeButtonTintColor: UIColor {
        return post.didLike ? .red : .black
    }
    var likeButtonImage: UIImage {
        return post.didLike ? #imageLiteral(resourceName: "like_selected") : #imageLiteral(resourceName: "like_unselected")
    }
    
    var likesLabelString: String {
        if post.likes != 1 {
            return "\(post.likes) likes"
        } else {
            return "\(post.likes) like"
        }
    }
    
    var timestampString: String? {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfYear]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .full
        return formatter.string(from: post.timestamp.dateValue(), to: Date())
    }
    
    init(post: Post){
        self.post = post
    }
}
