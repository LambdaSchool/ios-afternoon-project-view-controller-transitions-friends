//
//  FriendTableViewController.swift
//  Friends
//
//  Created by Jeremy Taylor on 5/23/19.
//  Copyright © 2019 Bytes-Random L.L.C. All rights reserved.
//

import UIKit

class FriendTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lucy = Friend(image: #imageLiteral(resourceName: "lucy"), name: "Lucy", bio: "Energetic Kid")
        let miles = Friend(image: #imageLiteral(resourceName: "miles"), name: "Miles", bio: "Curious")
        let clark = Friend(image: #imageLiteral(resourceName: "clark"), name: "Clark", bio: "Ball of fire")
        friendController.friends.append(lucy)
        friendController.friends.append(miles)
        friendController.friends.append(clark)
        
        navigationController?.delegate = navigationControllerDelegate
        
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
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowFriendDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            navigationControllerDelegate.sourceCell = tableView.cellForRow(at: indexPath)
            let detailVC = segue.destination as! FriendDetailViewController
            navigationControllerDelegate.detailVC = detailVC
        }
    }
    
    
    let friendController = FriendController()
    let navigationControllerDelegate = NavigationControllerDelegate()
}
