//
//  RecordsTableViewController.swift
//  Capture
//
//  Created by WLD_MBP_20 on 12/11/2015.
//  Copyright © 2015 probert. All rights reserved.
//

import UIKit
import CoreData

class RecordsTableViewController: UITableViewController, UISearchControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    
    var people:[Person] = []
    var companies:[Company] = []
    
    var searchController:UISearchController!
    
    // MARK: - Data Management
    
    @IBAction func addNewRecord(sender: AnyObject) {
        
        let alert = UIAlertController(title: "New Name",
            message: "Add a new name",
            preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save",
            style: .Default,
            handler: { (action:UIAlertAction) -> Void in
                
                let textField = alert.textFields!.first
                self.saveName(textField!.text!)
                self.tableView.reloadData()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel",
            style: .Default) { (action: UIAlertAction) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func saveName(fullname:String) {
        
        let p:Person = Person(context: CoreDataStack.sharedInstance.managedObjectContext)
        p.fullname = fullname
        p.isFlaggedForSync = NSNumber(bool: true)
        p.timestamp = NSDate()
        CoreDataStack.sharedInstance.saveContext()
        
        refreshData()
    }
    
    func refreshData() {
        
        // load the data
        
        do{
            people =    try Person.objectsInContext(CoreDataStack.sharedInstance.managedObjectContext, predicate: nil)
            companies = try Company.objectsInContext(CoreDataStack.sharedInstance.managedObjectContext, predicate: nil)
            
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
            
        }catch{
            
            fatalError("Ahhgg!")
        }
    }
    
    // MARK: - Boilerplate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self, action: "refreshData", forControlEvents: .ValueChanged)
        self.tableView.addSubview(self.refreshControl!)
        
        /*
            Setup SearchController
        */
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.scopeButtonTitles = ["People", "Companies"]
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
        
        
        refreshData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Search delegate
    
    func updateSearchResultsForSearchController(searchController: UISearchController){
        
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return people.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("recordCell", forIndexPath: indexPath)
        let person:Person = people[indexPath.row]
        
        cell.textLabel?.text = person.fullname
        cell.detailTextLabel?.text = person.email
        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    

}
