//
//  FriendController.swift
//  view-controller-transitions-friends
//
//  Created by Hector Steven on 5/16/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit


class FriendController {
	
	
	
	init() {
		let image1 = UIImage(named: "stoiczfpv-profile")!
		let f1 = Friend(name: "Hector",image: image1 , detail: "iOS6")
		friendList.append(f1)
		let image2 = UIImage(named: "BenGit")!
		let f2 = Friend(name: "Ben",image: image2 , detail: "iOS6 Instructor ")
		friendList.append(f2)
	}
	
	private(set) var friendList: [Friend] = []
}
