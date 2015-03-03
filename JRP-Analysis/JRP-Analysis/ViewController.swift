//
//  ViewController.swift
//  JRP-Analysis
//
//  Created by Girish on 3/3/15.
//  Copyright (c) 2015 Girish. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    let displayArra = ["IOS","Android","Windows","J2ME"];
    let textCellIdentifier = "TextCell"
    
    //Live testing

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate=self;
        tableView.dataSource=self;
        self.JSONParsin() ;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayArra.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {

        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as UITableViewCell
        let row = indexPath.row;
        //cell.textLabel.text = displayArra[row];
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        print(indexPath);
        print(displayArra[indexPath.row]);
    }
    
    func JSONParsin()
    {
        let urlString :String = "https://www.googleapis.com/freebase/v1/text/en/bob_dylan";
        let urlPath: String = urlString ;
        var url: NSURL = NSURL(string: urlPath)!
        var request1: NSURLRequest = NSURLRequest(URL: url)
        var response: AutoreleasingUnsafeMutablePointer<NSURLResponse?
        >=nil
        let queue = NSOperationQueue();
        NSURLConnection.sendAsynchronousRequest(request1, queue: queue, completionHandler: { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            if (error != nil) {
                println("API error: \(error), \(error.userInfo)")
            }
            var jsonError:NSError?
            var json:NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &jsonError) as NSDictionary
            if (jsonError != nil) {
                println("Error parsing json: \(jsonError)")
            }
            else {
                let status:String? = json["msg"] as? String
                println("server status: \(json.allKeys)");
                println("server status: \(json.allKeys)");
                println("server status: \(json.allValues)");
            }
        })
    }
    
}




