//
//  FriendController.swift
//  Friends
//
//  Created by Jeffrey Carpenter on 5/16/19.
//  Copyright © 2019 Jeffrey Carpenter. All rights reserved.
//

import UIKit

class FriendController {
    
    var friends = [Friend]()
    
    init() {
        friends.append(Friend(name: "Chef", image: UIImage(named: "chef")!))
        friends.append(Friend(name: "Worker", image: UIImage(named: "worker")!))
        friends.append(Friend(name: "Doctor", image: UIImage(named: "doctor")!))
    }
}
