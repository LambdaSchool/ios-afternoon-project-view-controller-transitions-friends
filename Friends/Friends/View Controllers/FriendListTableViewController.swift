//
//  FriendListTableViewController.swift
//  Friends
//
//  Created by Jeffrey Carpenter on 5/16/19.
//  Copyright © 2019 Jeffrey Carpenter. All rights reserved.
//

import UIKit

class FriendListTableViewController: UITableViewController {
    
    private let friendController = FriendController()

    override func viewDidLoad() {
        super.viewDidLoad()
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
        if segue.identifier == "ShowDetail" {
            
            guard let destinationVC = segue.destination as? FriendDetailViewController else {
                NSLog("destinationVC unable to cast as FriendDetailViewController")
                return
            }
            guard let indexPath = tableView.indexPathForSelectedRow else {
                NSLog("Unable to get indexPath for selected row")
                return
            }
            
            destinationVC.friend = friendController.friends[indexPath.row]
        }
    }

}
