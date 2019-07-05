//
//  TimelineTableViewController.swift
//  momhood3
//
//  Created by laptop on 2019-06-30.
//  Copyright © 2019 Langara. All rights reserved.
//

import UIKit

class TimelineTableViewController: UITableViewController {
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //hides the shadow from navigation bar
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.isNavigationBarHidden = false
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.init(rgb: 0x333333)]
        navigationItem.title = "Timeline"
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //number of cells is the number of week contained in timeline
        return timeline.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "WeekTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? WeekTableViewCell else {
            fatalError("The dequeued cell is not an instance of WeekTableViewCell.")
        }
        
        let week = timeline[indexPath.row]
        let weekCount = "week\(week.week_count ?? 0)"
        cell.contentView.backgroundColor = UIColor.init(rgb: weekColors[week.week_count!])
//        cell.backgroundColor = UIColor.init(rgb: weekColors[week.week_count!])
        cell.weekCountLabel.text = "Week \(week.week_count ?? 0)"
        cell.periodLabel.text = week.period
        cell.sizeOfBabyLabel.text = "Your baby size is of \(week.baby?.fruitsize ?? "")"
        cell.fruitImageView.image = UIImage(named:weekCount)

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
        
        guard let weekDetailViewController = segue.destination as? WeekDetailViewController
            else {
                fatalError("Unexpected destination: \(segue.destination)")
        }

        guard let selectedWeekCell = sender as? WeekTableViewCell
            else {
                fatalError("Unexpected sender: \(sender)")
        }
        
        guard let indexPath = tableView.indexPath(for: selectedWeekCell)
            else {
                fatalError("The selected cell is not being displayed by the table.")
        }
        
        let selectedWeek = timeline[indexPath.row]
        weekDetailViewController.week = selectedWeek
        
    }
    

}
