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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
