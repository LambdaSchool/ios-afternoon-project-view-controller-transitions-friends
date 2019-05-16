//
//  FriendController.swift
//  AnimatedFriends
//
//  Created by Lisa Sampson on 5/16/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

import UIKit

class FriendController {
    
    // MARK: - Properties
    var friends: [Friend] = []
    
    // MARK: - Initializers
    init() {
        let names: [String] = ["Lisa", "Grant"]
        let images: [UIImage] = [UIImage(named: "lisaprof")!, UIImage(named: "grant")!]
        let jobs: [String] = ["iOS Student", "Senior iOS Engineer"]
        
        var index: Int = 0
        
        for _ in names {
            createFriend(withName: names[index], image: images[index], andJob: jobs[index])
            index += 1
        }
    }
    
    // MARK: - CRUD
    func createFriend(withName name: String, image: UIImage, andJob job: String) {
        let friend = Friend(name: name, image: image, job: job)
        
        friends.append(friend)
    }
}
