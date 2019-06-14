//
//  FriendsTableViewController.swift
//  Friends
//
//  Created by Michael Stoffer on 6/13/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    let friendController = FriendController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - TableView DataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.friendController.friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath)

        let friend = self.friendController.friends[indexPath.row]
        cell.imageView?.image = friend.image
        cell.textLabel?.text = friend.name

        return cell
    }

    // MARK: - Methods
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToDetail" {
            guard let indexPath = self.tableView.indexPathForSelectedRow,
                let friendDVC = segue.destination as? FriendDetailViewController else { return }
            
            let friend = self.friendController.friends[indexPath.row]
            friendDVC.friend = friend
        }
    }

}
