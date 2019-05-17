//
//  FriendsTableViewController.swift
//  Friends
//
//  Created by Christopher Aronson on 5/16/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController, UIViewControllerTransitioningDelegate {
    let friendController = FriendController()
    let navigationControllerDelegate = NavigationControllerDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.delegate = navigationControllerDelegate
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendController.friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? CellTableViewCell else { return UITableViewCell() }

        cell.nameLabel.text = friendController.friends[indexPath.row].name
        cell.profilePictureImageView.image = friendController.friends[indexPath.row].image

        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            if let index = self.tableView.indexPathForSelectedRow {
                let detailVC = segue.destination as! FriendsDetailViewController
                detailVC.friend = friendController.friends[index.row]
                navigationControllerDelegate.sourceCell = (self.tableView.cellForRow(at: index) as! CellTableViewCell)
            }
        }
    }

}
