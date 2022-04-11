//
//  ViewController.swift
//  WorldWeather
//
//  Created by Xiyue Suo on 4/3/22.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let cities = ["Current Location", "Seattle", "Portland", "London", "Delhi", "Shanghai"];
    
    @IBOutlet weak var tblView: UITableView!
    let locationManager = CLLocationManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.requestLocation()
    }
    
    
    @IBAction func getLocationData(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        print("Error in getting location \(error.localizedDescription)")
    }
  
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        guard let location = locations.last else { return }
        
        let lat = location.coordinate.latitude
        let lng = location.coordinate.longitude
            
        print(lat)
        print(lng)
        
        let url = locationAPIURL
        getLocationData(url)
            .done { location in
                print(location.key)
                print(location.city)
                print(location.state)
                print(location.country)
            }
            .catch { error in
                print(error.localizedDescription)
            }
    }
}

