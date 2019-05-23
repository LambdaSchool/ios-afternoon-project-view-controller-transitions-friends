//
//  FriendsTableViewController.swift
//  Friends
//
//  Created by Kobe McKee on 5/23/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    let friendController = FriendController()
    let navigationControllerDelegate = NavigationControllerDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = navigationControllerDelegate
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendController.friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendTableViewCell else { return UITableViewCell() }
        
        let friend = friendController.friends[indexPath.row]
        
        cell.nameLabel.text = friend.name
        cell.friendImage.image = UIImage(named: friend.imageName)

        return cell
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPath = tableView.indexPathForSelectedRow {
            navigationControllerDelegate.sourceCell = tableView.cellForRow(at: indexPath) as? FriendTableViewCell
        }
        
        
        if segue.identifier == "FriendDetailSegue" {
            guard let destinationVC = segue.destination as? FriendDetailViewController,
                let friendIndex = tableView.indexPathForSelectedRow else { return }
            let friend = friendController.friends[friendIndex.row]
            destinationVC.friend = friend
            
        }
        
    }

}
