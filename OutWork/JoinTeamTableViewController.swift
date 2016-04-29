//
//  JoinTeamTableViewController.swift
//  OutWork
//
//  Created by Alexander Lee on 4/29/16.
//  Copyright © 2016 OutWorkDev. All rights reserved.
//

import UIKit

class JoinTeamTableViewController: UITableViewController {

    var teams = [DisplayTeam]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        loadSampleTeams()
    }

    func loadSampleTeams() {
        
        let logo1 = UIImage(named: "Brown")!
        let team1 = DisplayTeam(name: "Brown", sport: "Women's Lacrosse", logo: logo1)
        
        let logo2 = UIImage(named: "Clemson")!
        let team2 = DisplayTeam(name: "Clemson", sport: "Women's Soccer", logo: logo2)
        
        let logo3 = UIImage(named: "Cornell")!
        let team3 = DisplayTeam(name: "Cornell", sport: "Men's Basketball", logo: logo3)
        let team4 = DisplayTeam(name: "Cornell", sport: "Football", logo: logo3)
        
        let logo4 = UIImage(named: "Davidson")!
        let team5 = DisplayTeam(name: "Davidson", sport: "Women's Soccer", logo: logo4)
        
        let logo5 = UIImage(named: "Tiger")!
        let team6 = DisplayTeam(name: "Princeton", sport: "Field Hockey", logo: logo5)
        let team7 = DisplayTeam(name: "Princeton", sport: "Football", logo: logo5)
        let team8 = DisplayTeam(name: "Princeton", sport: "Men's Basketball", logo: logo5)
        let team9 = DisplayTeam(name: "Princeton", sport: "Men's Heavyweight Rowing", logo: logo5)
        let team10 = DisplayTeam(name: "Princeton", sport: "Men's Hockey", logo: logo5)
        let team11 = DisplayTeam(name: "Princeton", sport: "Men's Lacrosse", logo: logo5)
        let team12 = DisplayTeam(name: "Princeton", sport: "Men's Basketball", logo: logo5)
        let team13 = DisplayTeam(name: "Princeton", sport: "Women's Lacrosse", logo: logo5)
        let team14 = DisplayTeam(name: "Princeton", sport: "Women's Soccer", logo: logo5)
        
        let logo6 = UIImage(named: "SouthCarolina")!
        let team15 = DisplayTeam(name: "South Carolina", sport: "Women's Soccer", logo: logo6)
        
        let logo7 = UIImage(named: "Yale")!
        let team16 = DisplayTeam(name: "Yale", sport: "Men's Basketball", logo: logo7)
        
        teams += [team1, team2, team3, team4, team5, team6, team7, team8, team9, team10, team11, team12, team13, team14, team15, team16]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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
