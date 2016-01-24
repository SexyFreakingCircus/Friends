//
//  TableOfFriendsViewController.swift
//  Friend Circle
//
//  Created by Nicholas Miller on 1/23/16.
//  Copyright © 2016 Nicholas Miller. All rights reserved.
//

import UIKit
import Firebase

class TableOfFriendsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var myFriendsNames: [String] = ["One Fish", "Two Fish", "Red Fish", "Blue Fish"]
    
    // Ref for db
    var myRootRef : Firebase!
    
    var profImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFriendsNames.count
    }
    
    //    This function modifies the particular cell's rows
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TableOfFriendsViewCell", forIndexPath: indexPath) as! TableOfFriendsViewCell
        
        cell.nameLabel.text = myFriendsNames[indexPath.row]
        cell.friendImageView.image = profImage
        cell.friendImageView.contentMode = .ScaleToFill
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let cell = tableView.dequeueReusableCellWithIdentifier("TableOfFriendsViewCell", forIndexPath: indexPath) as! TableOfFriendsViewCell
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if segue.identifier == "FriendToAddFriend" {
            
            if let viewController = segue.destinationViewController as? AddNewFriendViewController {
                // this funky syntax below is a swift closure
                viewController.onDataAvailable = {[weak self]
                    (data: String) in
                    self?.myFriendsNames.append(data)
                    self?.tableView.reloadData()
                    //viewController.groupId =
                }
                
                viewController.onDataAvailable2 = {[weak self]
                    (myImage: UIImage) in
                    self?.profImage = myImage
                    self?.tableView.reloadData()
                }
            }
        }
    }

}
