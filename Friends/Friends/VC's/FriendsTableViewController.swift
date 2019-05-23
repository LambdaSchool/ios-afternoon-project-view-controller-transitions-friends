//
//  FriendsTableViewController.swift
//  Friends
//
//  Created by Jonathan Ferrer on 5/23/19.
//  Copyright © 2019 Jonathan Ferrer. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.delegate = delegate
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friendController.friends.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendTableViewCell

        let friend = friendController.friends[indexPath.row]
        cell.nameLabel.text = friend.name
        cell.friendImageView.image = friend.image

        delegate.sourceCell = tableView.cellForRow(at: indexPath)

        return cell
    }





    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowFriend" {
            let destinationVC = segue.destination as? FriendDetailViewController
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let friend = friendController.friends[indexPath.row]
            destinationVC?.friendController = friendController
            destinationVC?.friend = friend
            delegate.sourceCell = tableView.cellForRow(at: indexPath)
        }
    }

    let friendController = FriendController()
    let delegate = NavigationControllerDelegate()
}
