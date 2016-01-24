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
    
    let data = ["Eat", "Be Active", "Shop", "Nightlife", "Chill", "Arts", "Watch",  "Explore"]
    
    
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
        
        let option = data[indexPath.row].componentsSeparatedByString(", ")
        cell.OptionsCell.text = option.first
        
        if checked[indexPath.row] {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        
        cell.optionsImage.image = UIImage(named: data[indexPath.row])
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
