//
//  ViewController.swift
//  Friend Circle
//
//  Created by Nicholas Miller on 1/23/16.
//  Copyright © 2016 Nicholas Miller. All rights reserved.
//

import UIKit
import Firebase

class FriendViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate {

    // Main Container View of Content Below Navbar
    @IBOutlet var friendBubblesContainerView: UIView!
    
    // Collection View With User Friend Circles
    @IBOutlet var friendCirclesCollectionView: UICollectionView!
    
    // Bottom View With User Circle
    @IBOutlet var userView: UIView!
    
    var myGroupNames: [String] = []
    var myGroupIds: [String] = []
        
    // Ref for db
    var myRootRef : Firebase!
    var defaults : NSUserDefaults!
    var userKey : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        defaults = NSUserDefaults.standardUserDefaults()
        userKey = defaults.objectForKey("userKey") as! String
        
        // Set db for Firebase
        myRootRef = Firebase(url:"https://sizzling-inferno-9040.firebaseio.com/users/\(userKey)/groups")
        
        myRootRef.observeSingleEventOfType(.Value, withBlock: { snapshot in
            if let groups = snapshot.children {
                
                for (var i = 0; i < Int(snapshot.childrenCount); i++) {
                
                    let group = groups.nextObject() as! FDataSnapshot
                
                    let name = group.value
                
                    self.myGroupIds.append(group.key as! String)
                    self.myGroupNames.append(name.valueForKey("name") as! String)
                
                    NSLog("\(group)")
                    NSLog("\(name)")
    
                }
                
            }
            
            self.friendCirclesCollectionView.reloadData()

        })
        
        // Setup delegate / datasource of friendCirclesCollectionView
        friendCirclesCollectionView.delegate = self
        friendCirclesCollectionView.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func friendCirlceButtonPressed() {
        print("Friend Cirlce Pressed")
    }

    func userCirlceButtonPressed() {
        print("User Cirlce Pressed")
    }

    
    // COLLECTION VIEW FUNCTIONS
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // Return # of friend circles of user
//        if let value = myGroupNames.count as? Int {
//            return value
//        }
//        else {
//            return 1
//        }
        
        if let value = myGroupNames.count as? Int {
            return value
        }
        else {
            return 1
        }
        
     }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        // Setup the the prototype cell indexPath
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FriendCircleCell", forIndexPath: indexPath) as! FriendCircleCell
        
        cell.groupNameLabel.text = myGroupNames[indexPath.row]
//        cell.groupId = myGroupIds[indexPath.row]
        
        myRootRef = Firebase(url:"https://sizzling-inferno-9040.firebaseio.com/users/\(userKey)/groups")
        
        myRootRef.observeSingleEventOfType(.Value, withBlock: { snapshot in
            if let groups = snapshot.children {
                
                for (var i = 0; i < Int(snapshot.childrenCount); i++) {
                    
                    let group = groups.nextObject() as! FDataSnapshot
                    
                    let name = group.value
                    
                    self.myGroupIds.append(group.key as! String)
                    
                }
                
            }
            
            self.friendCirclesCollectionView.reloadData()
            
            cell.groupId = self.myGroupIds[indexPath.row]
            
        })
        
//        cell.groupId = myGroupIds[indexPath.row]
        
        // Done, lets do the next cell
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if segue.identifier == "GroupToAddGroup" {
            
            if let viewController = segue.destinationViewController as? AddNewGroupViewController {
                // this funky syntax below is a swift closure
                viewController.onDataAvailable = {[weak self]
                    (data: String) in
                    self?.myGroupNames.append(data)
                    self?.friendCirclesCollectionView.reloadData()
//                    viewController.myRootRef = self!.myRootRef as! Firebase
                }
            }
        }
    }

}

