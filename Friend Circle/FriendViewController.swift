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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
        return 3
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        // Setup the the prototype cell indexPath
        let cell=collectionView.dequeueReusableCellWithReuseIdentifier("FriendCircleCell", forIndexPath: indexPath) as! FriendCircleCell
        
        // Set the details using the cell and the index path
        
        // Log to console movie row
        print("row \(indexPath.row)")
        
        // Done, lets do the next cell
        return cell
    }

}

