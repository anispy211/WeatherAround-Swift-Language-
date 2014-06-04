//
//  ViewController.swift
//  WeatherAround
//
//  Created by Aniruddha Kadam on 6/3/14.
//  Copyright (c) 2014 Aniruddha Kadam. All rights reserved.
//

import UIKit
import CoreLocation
import CoreGraphics

class MainViewController: UITableViewController
{
    
    @IBOutlet var mainTable:UITableView;
    
    @IBOutlet var mainLBL :UILabel;
    
    var cities : NSMutableArray = [];


    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        println("!!--- WelCome To Swift -----!!")
        self.view.backgroundColor = UIColor.darkGrayColor()
        cities = NSMutableArray()
        
        cities = ["Pune","Delhi","Nagpur","Amravati"];
        
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MainCell")

        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    
    // Location Manager
    
    func ConfigureUserLocation()
    {
        
        
        var locationMgr = LocationManager.sharedInstance
        locationMgr.init1();
        locationMgr.startLocationUpdate();

    }
    
    
    
    
    @IBAction func leftBarButtonClicked(sender:UIBarButtonItem)
    {
        self.tableView.setEditing(!self.tableView.editing, animated: true)
        if(self.tableView.editing)
        {
            sender.style = UIBarButtonItemStyle.Done
            self.navigationItem.leftBarButtonItem.title = "Done"
        }
        else
        {
            
            sender.style = UIBarButtonItemStyle.Done
            self.navigationItem.leftBarButtonItem.title = "Done"

        }
        
        self.navigationItem.rightBarButtonItem.enabled = !self.navigationItem.rightBarButtonItem.enabled
        
        
    }
    
    
    
    @IBAction func rightBarButtonClicked(sender:UIBarButtonItem)
    {
        ConfigureUserLocation()

      //  addCityInputAletView ()
        
    }
    
    //
    func addCityInputAletView ()
    {
        let alert = UIAlertController(title: "Please enter city name", message:nil , preferredStyle:.Alert)
        
        // Add the text field for text entry.
        alert.addTextFieldWithConfigurationHandler { textField in
            // If you need to customize the text field, you can do so here.
        }
        
        // Create the actions.
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { action in
            NSLog("The \"Text Entry\" alert's cancel action occured.")
        }
        
        let otherAction = UIAlertAction(title: "Ok", style: .Default) { action in

            var cityname: UITextField = alert.textFields[0] as UITextField
            
            var cityN:NSString = cityname.text as NSString
            self.cities.addObject(cityN)
            
            self.tableView.reloadData()
        
        }
        
        // Add the actions.
        alert.addAction(cancelAction)
        alert.addAction(otherAction)
        
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    
  
    
    
   // #pragma mark --  UItableView Data source
    
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int
    {
        
        return 1;
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return cities.count
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        
        
      //  let cell: MainCell = MainCell(frame:CGRectMake(0, 0 , 320, 72) , reuseIdentifier:"MainCell")
        
        //MainCell(style: UITableViewCellStyle.Default, reuseIdentifier: "SwiftMainCell")
        
        
        
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("MainCell") as UITableViewCell

        
        if(cell == nil)
        {
          cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier:"MainCell")
        }
        
        var name1 : NSString  = cities[indexPath.row] as NSString

        
        var descriptionLbl:UILabel = UILabel(frame: CGRectMake(9, 6, 159, 26))
        descriptionLbl.text = name1;
        cell.addSubview(descriptionLbl)
        
        
        var cityNameLbl:UILabel = UILabel(frame: CGRectMake(9, 39, 186, 26))
        cityNameLbl.text = name1;
        cell.addSubview(cityNameLbl)
        
        
        var tempLbl:UILabel = UILabel(frame: CGRectMake(221, 9, 91, 56))
        tempLbl.text = name1;
        cell.addSubview(tempLbl)
        
        var weatherIcon:UIImageView = UIImageView(frame: CGRectMake(181, 6, 37, 37))
        weatherIcon.image = UIImage(named: "wth")
        cell.addSubview(weatherIcon)
        
        cell.backgroundColor = UIColor.clearColor()
        

        
        
        return  cell;
        
    }
    
  //  #pragma mark - UItableView delegate
    
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!)
    {
        
        cities.removeObjectAtIndex(indexPath.row)
        self.tableView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

