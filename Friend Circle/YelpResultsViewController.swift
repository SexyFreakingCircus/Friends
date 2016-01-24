//
//  YelpResultsViewController.swift
//  Friend Circle
//
//  Created by Nicholas Miller on 1/24/16.
//  Copyright © 2016 Nicholas Miller. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class YelpResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var selected: [String] = []
    
    var businesses: [Business] = []
    
    let geocoder = CLGeocoder()
    //    Need this as a property for our class because the coreLocation delegate
    let locationManager = CLLocationManager()
    var location: CLLocation?
    var updatingLocation = false
    var lastLocationError: NSError?
    
    var longitude: CLLocationDegrees = 0.0
    var latitude: CLLocationDegrees = 0.0
    
    var chosenTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let authStatus: CLAuthorizationStatus =
        CLLocationManager.authorizationStatus()
        if authStatus == .NotDetermined {
            locationManager.requestWhenInUseAuthorization()
            return
        }
        
//        Gets the current location
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
        startLocationManager()
        
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
        for elements in selected {
            callYelpAPI(elements)
        }

    }
    
    //    Whenever we fail to get the location
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("didFailWithError \(error)")
        
        if (error.code == CLError.LocationUnknown.rawValue) {
            return
        }
        //        We keep the last error we encountered
        lastLocationError = error
        stopLocationManager()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation = locations.last! as CLLocation
        print("didUpdateLocations \(newLocation)")
        
        longitude = newLocation.coordinate.longitude
        latitude = newLocation.coordinate.latitude
        
        lastLocationError = nil
        location = newLocation
        placeNameFromLatLong()
    }
    
    //    This will start the location gathering
    func startLocationManager() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            updatingLocation = true
        }
    }
    
    //    This will stop the location gathering
    func stopLocationManager() {
        if (updatingLocation) {
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
            updatingLocation = false
        }
    }
    
    func placeNameFromLatLong() {
        geocoder.reverseGeocodeLocation(location!, completionHandler: {(placemarks, error) in
            if (error != nil) {
                print("reverse geodcode fail: \(error!.localizedDescription)")
            } else {
                let placemark = placemarks! as [CLPlacemark]
                let locationName = placemark[0].name
                
                print(locationName)
                
            }
            
        })
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
        
        if let imageUrl = businesses[indexPath.row].imageURL! as? NSURL {
            cell.posterImageView.setImageWithURL(imageUrl)
        }
        else {
            cell.posterImageView.image = UIImage(named: "ic_grade")
        }
        
        cell.posterImageView.setImageWithURL(businesses[indexPath.row].imageURL!)
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.dequeueReusableCellWithIdentifier("YelpResultsTableViewCell", forIndexPath: indexPath) as! YelpResultsTableViewCell
        
        chosenTitle = cell.placeNameLabel.text!
        
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
            self.stopLocationManager()
        })
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ResultsToInvite" {
            
            
//            print(businesses[indexPath!.row].name
        }
    }

}
