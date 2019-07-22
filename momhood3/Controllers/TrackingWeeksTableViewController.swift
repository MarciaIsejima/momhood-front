//
//  TrackingWeeksTableViewController.swift
//  momhood3
//
//  Created by laptop on 2019-07-21.
//  Copyright © 2019 Langara. All rights reserved.
//

import UIKit

class TrackingWeeksTableViewController: UITableViewController {

    private var weeks: [Int] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //populate weeks array

        for i in stride(from: pregnancy.firstDayOfWeek.count, to: 0, by: -1) {
            weeks.append(i)
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.isNavigationBarHidden = false
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.init(rgb: 0x333333)]
        navigationItem.title = "Previous Weeks"
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weeks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weekCell", for: indexPath)

        // Configure the cell...
        let text = "Week \(weeks[indexPath.row])"
        
        cell.textLabel?.text = text

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        guard let trackingTableViewController = segue.destination as? TrackingTableViewController
            else {
                fatalError("Unexpected destination: \(segue.destination)")
        }
        
        guard let selectedWeekCell = sender as? UITableViewCell
            else {
                fatalError("Unexpected sender: \(sender)")
        }
        
        guard let indexPath = tableView.indexPath(for: selectedWeekCell)
            else {
                fatalError("The selected cell is not being displayed by the table.")
        }
        
        let selectedWeek = weeks[indexPath.row] - 1
        trackingTableViewController.selectedWeek = selectedWeek
    }
    

}
