//
//  FriendsTableViewController.swift
//  Friends
//
//  Created by Thomas Cacciatore on 5/30/19.
//  Copyright © 2019 Thomas Cacciatore. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friendController.friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendTableViewCell else { fatalError("Error: unable to dequeue cell!")}

        let friend = friendController.friends[indexPath.row]
        cell.friend = friend

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue" {
            guard let destinationVC = segue.destination as? ViewController,
            let indexPath = tableView.indexPathForSelectedRow else { return }
            destinationVC.friendController = friendController
            destinationVC.friend = friendController.friends[indexPath.row]
            
        }
    }
    
    var friendController = FriendController()
   

}
