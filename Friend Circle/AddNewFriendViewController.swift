//
//  AddNewFriendViewController.swift
//  Friend Circle
//
//  Created by Nicholas Miller on 1/23/16.
//  Copyright © 2016 Nicholas Miller. All rights reserved.
//

import UIKit

class AddNewFriendViewController: UIViewController {
    
    var onDataAvailable : ((data: String) -> ())?
    
    @IBOutlet weak var newNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sendData(data: String) {
        // Whenever you want to send data back to CheckListViewController, check
        // if the closure is implemented and then call it if it is
        self.onDataAvailable?(data: data)
    }
    
    @IBAction func cancleView(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func screenTapped(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func doneButtonTouched(sender: AnyObject) {
        if self.newNameTextField.text!.characters.count > 0 {
            sendData(self.newNameTextField.text!)
            self.newNameTextField.text = ""
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    

}
