//
//  LocationManager.swift
//  WeatherAround
//
//  Created by codewalla on 04/06/14.
//  Copyright (c) 2014 Aniruddha Kadam. All rights reserved.
//

import Foundation
import CoreLocation



class LocationManager: NSObject , CLLocationManagerDelegate
{
   
   var locationManager :CLLocationManager!
    
        
    
            struct LocationManagerSingleton {
                static var sharedInstance: LocationManager?
                static var onceToken: dispatch_once_t = 0
            }
            
            class var sharedInstance: LocationManager
            {
                get
                {
                    dispatch_once(&LocationManagerSingleton.onceToken,
                    {
                        LocationManagerSingleton.sharedInstance = LocationManager()
                    })
                    return LocationManagerSingleton.sharedInstance!
                }
            }
    
    
    
    
    
    override func `self`() -> LocationManager
    {
        self.superclass()
        
        if(self != nil)
        {
            locationManager =  CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        }
        
        return self
        
    }
    
    func init1()
    {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    
    func startLocationUpdate()
    {
        
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func stopLocationUpdate()
    {
        locationManager.stopUpdatingLocation()

    }
    
 //   #pragma mark CLLocation Manager Delgate
    
     func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!)
    {
     
        println(error)
    
    }

    
    
     func locationManager(manager: CLLocationManager!, didUpdateToLocation newLocation: CLLocation!, fromLocation oldLocation: CLLocation!)
    {
    
        NSLog("oldLocation: \(oldLocation) newLocation: \(newLocation)")

    }
    
    
   
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: AnyObject[]!)
    {
        
    }
    func locationManager(manager: CLLocationManager!, didUpdateHeading newHeading: CLHeading!)
    {
        
    }
    func locationManagerShouldDisplayHeadingCalibration(manager: CLLocationManager!) -> Bool
    {
        return true
    }
    func locationManager(manager: CLLocationManager!, didDetermineState state: CLRegionState, forRegion region: CLRegion!)
    {
        
    }
    func locationManager(manager: CLLocationManager!, didRangeBeacons beacons: AnyObject[]!, inRegion region: CLBeaconRegion!)
    {
        
    }
    func locationManager(manager: CLLocationManager!, rangingBeaconsDidFailForRegion region: CLBeaconRegion!, withError error: NSError!)
    {
        
    }
    
     func locationManager(manager: CLLocationManager!, didEnterRegion region: CLRegion!)
    {
        
    }
    func locationManager(manager: CLLocationManager!, didExitRegion region: CLRegion!)
    {
        
    }
   
    func locationManager(manager: CLLocationManager!, monitoringDidFailForRegion region: CLRegion!, withError error: NSError!)
    {
        
    }
  

}