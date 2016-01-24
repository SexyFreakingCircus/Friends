//
//  AddNewFriendViewController.swift
//  Friend Circle
//
//  Created by Nicholas Miller on 1/23/16.
//  Copyright © 2016 Nicholas Miller. All rights reserved.
//

import UIKit
import Firebase

class AddNewFriendViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var onDataAvailable : ((data: String) -> ())?
    var onDataAvailable2 : ((myImage: UIImage) -> ())?
    
    @IBOutlet weak var newNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    // Ref for db
    var myRootRef : Firebase!
    
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self

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
    func sendData2(myImage: UIImage) {
        // Whenever you want to send data back to CheckListViewController, check
        // if the closure is implemented and then call it if it is
        self.onDataAvailable2?(myImage: myImage)
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
            sendData2(self.imageView.image!)
            self.newNameTextField.text = ""
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func albumButtonTouched(sender: AnyObject) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.contentMode = .ScaleToFill
            imageView.image = pickedImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

}
