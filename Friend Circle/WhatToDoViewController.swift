//
//  WhatToDoViewController.swift
//  Friend Circle
//
//  Created by Bryan Rivera on 1/23/16.
//  Copyright © 2016 Nicholas Miller. All rights reserved.
//

import UIKit

class WhatToDoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let CellIdentifier = "TableCellView"
    
    let data = ["Eat", "Active", "Shop", "Nightlife", "Chill", "Arts", "Entertainment",  "Explore"]
    
    var selected: [String] = []
    
    var checked: [Bool]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        checked = [Bool](count: data.count, repeatedValue: false)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: CellIdentifier)

        
        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        checked[indexPath.row] = !checked[indexPath.row]
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("OptionsCell", forIndexPath: indexPath) as! OptionsTableViewCell
        
        cell.OptionsCell.text = data[indexPath.row]
        
        if checked[indexPath.row] {
            cell.accessoryType = .Checkmark
            selected.append(data[indexPath.row])
        } else {
            cell.accessoryType = .None
            selected = arrayRemovingObject(data[indexPath.row], fromArray: selected)
            
        }
        
        cell.optionsImage.image = UIImage(named: data[indexPath.row])
        
        return cell
    }

    
    func arrayRemovingObject<U: Equatable>(object: U, fromArray:[U]) -> [U] {
        return fromArray.filter { return $0 != object }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ToYelpResults" {
            let yelpViewController = segue.destinationViewController as! YelpResultsViewController
            yelpViewController.selected = self.selected
        }
    }

}
