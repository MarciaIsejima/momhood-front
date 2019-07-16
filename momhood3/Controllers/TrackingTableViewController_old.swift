//
//  TrackingTableViewController.swift
//  momhood3
//
//  Created by laptop on 2019-07-16.
//  Copyright © 2019 Langara. All rights reserved.
//

import UIKit

class TrackingTableViewController2: UITableViewController {

    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var waistTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //hides the shadow from navigation bar
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        
        //show navigation bar
        self.navigationController!.isNavigationBarHidden = false
        //set page title
        navigationItem.title = "Week 16"
        
        weightTextField.setBottomBorder()
        waistTextField.setBottomBorder()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //set left bar button image
        let customButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 30, height: 30))
        customButton.setImage(UIImage.init(named:"calendarBlack"), for: .normal)
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: customButton)
        
        
        
        
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
