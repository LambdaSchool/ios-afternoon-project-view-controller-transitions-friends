//
//  FriendTableViewController.swift
//  Friends
//
//  Created by Jeremy Taylor on 5/23/19.
//  Copyright © 2019 Bytes-Random L.L.C. All rights reserved.
//

import UIKit

class FriendTableViewController: UITableViewController {
    let friendController = FriendController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lucy = Friend(image: UIImage(named: "lucy")! , name: "Lucy", bio: "Energetic Kid")
        let miles = Friend(image: UIImage(named: "miles")!, name: "Miles", bio: "Curious")
        let clark = Friend(image: UIImage(named: "clark")!, name: "Clark", bio: "Ball of fire!")
        
        friendController.friends.append(lucy)
        friendController.friends.append(miles)
        friendController.friends.append(clark)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return friendController.friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath)
        
        let friend = friendController.friends[indexPath.row]

        cell.imageView?.image = friend.image
        cell.textLabel?.text = friend.name

        return cell
    }
    

   
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetailVC" {
            guard let detailVC = segue.destination as? FriendDetailViewController else { return }
            
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let friend = friendController.friends[indexPath.row]
            detailVC.friend = friend
        }
    }
    

}
