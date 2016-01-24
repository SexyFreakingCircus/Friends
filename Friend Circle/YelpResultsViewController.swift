//
//  YelpResultsViewController.swift
//  Friend Circle
//
//  Created by Nicholas Miller on 1/24/16.
//  Copyright © 2016 Nicholas Miller. All rights reserved.
//

import UIKit

class YelpResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var selected: [String] = []
    
    var businesses: [Business] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
        for elements in selected {
            callYelpAPI(elements)
        }

    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if let value = selected.count as? Int {
            return value
        }
        else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let value = businesses.count as? Int {
            return value
        }
        else {
            return 0
        }
    }
    
    //    This function modifies the particular cell's rows
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("YelpResultsTableViewCell", forIndexPath: indexPath) as! YelpResultsTableViewCell
        cell.backgroundColor = UIColor.blackColor()
        
        cell.placeNameLabel.text = businesses[indexPath.row].name
        cell.placeDistanceLabel.text = businesses[indexPath.row].distance
        cell.placeRatingImageView.setImageWithURL(businesses[indexPath.row].ratingImageURL!)
        cell.posterImageView.setImageWithURL(businesses[indexPath.row].imageURL!)
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.dequeueReusableCellWithIdentifier("YelpResultsTableViewCell", forIndexPath: indexPath) as! YelpResultsTableViewCell
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func callYelpAPI(keyWord: String) {
        Business.searchWithTerm(keyWord, completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            
//            for business in businesses {
//                print(business.name!)
//                print(business.address!)
//            }
            
            self.tableView.reloadData()
        })
    }

}
