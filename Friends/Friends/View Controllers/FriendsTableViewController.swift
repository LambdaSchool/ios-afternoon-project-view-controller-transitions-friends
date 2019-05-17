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
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath)
        
        cell.textLabel?.text = friendController.friends[indexPath.row].name
        cell.imageView?.image = friendController.friends[indexPath.row].image
        
        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let index = tableView.indexPathForSelectedRow {
            navigationControllerDelegate.sourceCell = tableView.cellForRow(at: index)
            if segue.identifier == "ShowDetail" {
                guard let destinationVC = segue.destination as? FriendsDetailViewController else { return }
                destinationVC.friend = friendController.friends[index.row]
            }
        }
    }

}
