//
//  ViewController.swift
//  GetLocation
//
//  Created by Xiyue Suo on 3/13/22.
//

import UIKit
import CoreLocation

/*
 1. cerate Privacy Location entries in Info.plist for Always and when in use
 2. Import CoreLocation library
 3. Create outlets and add CLLocationmanagerDelegate int he calss
 4. create a location manager instance let locationmanage = CCLocationManager()
 5. In the viewdidLoad set delegate, request usage and accuracy
 6. add didUpdateLocations function for locationManager this ifunction will be called whrn any location and write the didfailw\WithError function
 7. when you want to get location just once you will add that in a buttion and add call locationManager.requestLocation)_ This will get the location one time
 8. when you want ot get locatio chainge in the background and want to monitor changed you will make the following code:
    if CLLocationManager.significantLocationChangeMonitoringAvailable() {
        locationManager.startMonitoringSignificantLocationChanges()
        locationManager.startUpdatingLocation()
    }
 */


class ViewController: UIViewController, CLLocationManagerDelegate{

    @IBOutlet weak var lblLatitude: UILabel!
    @IBOutlet weak var lblLongitude: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        //47.65558801743674, -122.30319803671671
        startSignificantLocationChange() //no click
        
        
    }

    @IBAction func getLocationAction(_ sender: Any) {
        locationManager.requestLocation()
        //startSignificantLocationChange() // one click, then keep monitoring
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error in getting location \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        
        let lat = location.coordinate.latitude
        let lng = location.coordinate.longitude
        
        print(lat)
        print(lng)
        
        lblLatitude.text = "Latitude: \(lat)"
        lblLongitude.text = "Longitude: \(lng)"
        
        getAddress(location: location)
    }
    
    func startSignificantLocationChange() {
        if CLLocationManager.significantLocationChangeMonitoringAvailable() {
            locationManager.startMonitoringSignificantLocationChanges()
            locationManager.startUpdatingLocation()
        }
    }
    
    func getAddress(location : CLLocation) {
        let clGeocoder = CLGeocoder()
        clGeocoder.reverseGeocodeLocation(location) { placeMarks, error in
            if error != nil {
                self.lblAddress .text = "Unable to get Address"
                return
            }
            
            guard let place = placeMarks?[0] else {return}
            
            var address = ""
            if place.name != nil {
                address += place.name! + ", "
            }
            if place.locality != nil {
                address += place.locality! + ", "
            }
            if place.subLocality != nil {
                address += place.subLocality! + ", "
            }
            if place.postalCode != nil {
                address += place.postalCode! + ", "
            }
            if place.country != nil {
                address += place.country! + ", "
            }
            if place.region != nil {
                print("Region: \(place.region!)")
            }
            
            print(address)
            self.lblAddress.text = address
            
        }
    }
    
    
}

