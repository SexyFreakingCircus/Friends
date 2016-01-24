//
//  AddNewGroupViewController.swift
//  Friend Circle
//
//  Created by Nicholas Miller on 1/23/16.
//  Copyright © 2016 Nicholas Miller. All rights reserved.
//

import UIKit
import Firebase

class AddNewGroupViewController: UIViewController {
    
    var onDataAvailable : ((data: String) -> ())?

    // Ref for db
    var myRootRef : Firebase!
    
    @IBOutlet weak var groupNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        var defaults = NSUserDefaults.standardUserDefaults()
        let userKey = defaults.objectForKey("userKey") as! String
        
        myRootRef = Firebase(url:"https://sizzling-inferno-9040.firebaseio.com/users/\(userKey)/")
    }
    
    
    @IBAction func closeView(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func doneButtonTouched(sender: AnyObject) {
        if self.groupNameTextField.text!.characters.count > 0 {
            
            let groupsRef = myRootRef.childByAppendingPath("groups")
            
            let newGroupRef = groupsRef.childByAutoId()
            
            if let myText = self.groupNameTextField.text {
                let newGroup = ["name": myText]
                newGroupRef.setValue(newGroup)
                let groupId = newGroupRef.key
            }
            

            
            sendData(self.groupNameTextField.text!)
            self.groupNameTextField.text = ""
            
            
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func sendData(data: String) {
        // Whenever you want to send data back to CheckListViewController, check
        // if the closure is implemented and then call it if it is
        self.onDataAvailable?(data: data)
    }
    
    
    @IBAction func screenTapped(sender: AnyObject) {
        view.endEditing(true)

    }
    
}
