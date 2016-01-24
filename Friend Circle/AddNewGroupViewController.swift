//
//  AddNewGroupViewController.swift
//  Friend Circle
//
//  Created by Nicholas Miller on 1/23/16.
//  Copyright © 2016 Nicholas Miller. All rights reserved.
//

import UIKit

class AddNewGroupViewController: UIViewController {
    
    var onDataAvailable : ((data: String) -> ())?
    
    @IBOutlet weak var groupNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func closeView(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func doneButtonTouched(sender: AnyObject) {
        if self.groupNameTextField.text!.characters.count > 0 {
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
    
}
