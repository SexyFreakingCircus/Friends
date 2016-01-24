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
    
    var myGroupNames: [String] = ["Soccer", "CPE", "Other"]
    
    var businesses: [Business]!
    
    // Ref for db
    var myRootRef : Firebase!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // Set db for Firebase
        myRootRef = Firebase(url:"https://docs-examples.firebaseio.com/")
        
        // Setup delegate / datasource of friendCirclesCollectionView
        friendCirclesCollectionView.delegate = self
        friendCirclesCollectionView.dataSource = self
        
        Business.searchWithTerm("Thai", completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            
            for business in businesses {
                print(business.name!)
                print(business.address!)
            }
        })

        
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
        return myGroupNames.count
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        // Setup the the prototype cell indexPath
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FriendCircleCell", forIndexPath: indexPath) as! FriendCircleCell
        
        cell.groupNameLabel.text = myGroupNames[indexPath.row]
        
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
                }
            }
        }
    }

}

