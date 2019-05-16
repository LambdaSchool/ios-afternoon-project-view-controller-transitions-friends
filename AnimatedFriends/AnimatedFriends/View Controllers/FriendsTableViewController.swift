//
//  FriendsTableViewController.swift
//  AnimatedFriends
//
//  Created by Lisa Sampson on 5/16/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    // MARK: - Properties
    let friendController = FriendController()
    let navControllerDelegate = NavigationControllerDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.delegate = navControllerDelegate
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendController.friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendTableViewCell

        cell.friend = friendController.friends[indexPath.row]

        return cell
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue" {
            let detailVC = segue.destination as! FriendDetailViewController
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            detailVC.friend = friendController.friends[indexPath.row]
            
            guard let cell = tableView.cellForRow(at: indexPath) as? FriendTableViewCell else { return }
            navControllerDelegate.sourceCell = cell
        }
    }
}
