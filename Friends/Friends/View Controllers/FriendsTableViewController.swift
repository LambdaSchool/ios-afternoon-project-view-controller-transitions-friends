//
//  FriendsTableViewController.swift
//  Friends
//
//  Created by Michael Stoffer on 6/13/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    // MARK: - IBOutlets and Properties
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    let friendController = FriendController()
    let delegate = NavigationControllerDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = delegate
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
        
        self.delegate.sourceCell = tableView.cellForRow(at: indexPath)

        return cell
    }
    
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
