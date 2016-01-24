//
//  ViewController.swift
//  Friend Circle
//
//  Created by Nicholas Miller on 1/23/16.
//  Copyright © 2016 Nicholas Miller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        configureButtons()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func thumbsUpButtonPressed() {
        print("thumbs up button pressed")
    }
    
    func configureButtons() {
        
        let friendButton = UIButton(type: .Custom)
        friendButton.frame = CGRectMake(160, 100, 50, 50)
        friendButton.layer.cornerRadius = 0.5 * friendButton.bounds.size.width
        friendButton.layer.masksToBounds = true
        friendButton.setImage(UIImage(named:"black"), forState: .Normal)
        friendButton.setTitle("nick", forState: .Normal)
        friendButton.addTarget(self, action: "thumbsUpButtonPressed", forControlEvents: .TouchUpInside)
        view.addSubview(friendButton)
        
    }

}

