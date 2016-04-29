//
//  TeamTableViewController.swift
//  OutWork
//
//  Created by Jack O'Brien on 4/28/16.
//  Copyright (c) 2016 OutWorkDev. All rights reserved.
//

import UIKit

class TeamTableViewController: UITableViewController {
    
    var teams = [DisplayTeam]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        loadSampleTeams()
        
        joinOrCreate()
    }

    func loadSampleTeams() {
        let logo1 = UIImage(named: "Tiger")!
        let team1 = DisplayTeam(name: "Princeton", sport: "Men's Basketball", logo: logo1)
        
        teams += [team1]
    }
    
    func joinOrCreate() {
        let logoJoin = UIImage(named: "Team")!
        let join = DisplayTeam(name: "Join", sport: "Find your team", logo: logoJoin)
        
        let logoCreate = UIImage(named: "Plus")!
        let create = DisplayTeam(name: "Create", sport: "Create a new team page", logo: logoCreate)
    
    
        teams += [join, create]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return teams.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIndetifier = "TeamTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIndetifier, forIndexPath: indexPath) as! TeamTableViewCell

        let team = teams[indexPath.row]
        
        cell.name.text = team.name
        cell.sport.text = team.sport
        cell.logo.image = team.logo

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
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
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
