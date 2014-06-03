//
//  ViewController.swift
//  WeatherAround
//
//  Created by Aniruddha Kadam on 6/3/14.
//  Copyright (c) 2014 Aniruddha Kadam. All rights reserved.
//

import UIKit


class MainViewController: UITableViewController
{
    
    @IBOutlet var mainTable:UITableView;
    
    var cities : NSMutableArray = [];
    
    
                            
    override func viewDidLoad()
    {
        super.viewDidLoad()

        println("!!--- WelCome To Swift -----!!")
        self.view.backgroundColor = UIColor.darkGrayColor()
        cities = NSMutableArray()
        
        cities = ["Pune","Delhi","Nagpur","Amravati"];
        
        
        // Do any additional setup after loading the view, typically from a nib.
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
     
        addCityInputAletView ()
        
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
        
        
        let cell: MainCell =  MainCell(style: UITableViewCellStyle.Default, reuseIdentifier: "SwiftMainCell")
        
        var name1 : NSString  = cities[indexPath.row] as NSString
        
        cell.textLabel.text = name1
        
        cell.textLabel.textColor = UIColor.whiteColor()
        
        cell.backgroundColor = UIColor.clearColor()

        
        
        return cell;
        
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

