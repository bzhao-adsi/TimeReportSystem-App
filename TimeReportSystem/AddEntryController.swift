//
//  AddEntryController.swift
//  TimeReportSystem
//
//  Created by ADSI Intern III on 2/8/17.
//  Copyright © 2017 ADSI. All rights reserved.
//

import UIKit

class AddEntryController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //duedate=item.duedate

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Period: UILabel!
    @IBOutlet weak var Date: UILabel!
    @IBOutlet weak var Project: UILabel!
    @IBOutlet weak var WorkTime: UILabel!
    @IBOutlet weak var NameText: UITextField!
    @IBOutlet weak var PeriodText: UITextField!
    @IBOutlet weak var ProjectText: UITextField!
    @IBOutlet weak var WorkTimeText: UITextField!
    
    
    @IBOutlet weak var datePickerCell: UITableViewCell!
    @IBOutlet weak var datePicker:UIDatePicker!
    
    var duedate=NSDate()
    var datePickerVisible=false
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 2
        // #warning Incomplete implementation, return the number of rows
        //if section == 0 && datePickerVisible {
        //    return 2
        //}
        //else if section==0 && datePickerVisible==false{
        //    return 1
        //}
        //else {
        //    return super.tableView(tableView, numberOfRowsInSection: section)
        //}
    }


    func showDatePicker() {
        datePickerVisible = true
        //let indexPathDatePicker=IndexPath(row:1,section: 0)
        
        //tableView.insertRows(at: [indexPathDatePicker], with: .fade)
        //duedate=datePicker.date as NSDate
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section==0 && indexPath.row==1{
            return 217
        }
        else{
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "calend", for: indexPath)
        //return cell
        
        if indexPath.section==0 && indexPath.row==1{
            let label1=cell.viewWithTag(998) as!UILabel
            let label2=cell.viewWithTag(997) as!UILabel
            label1.text=""
            label2.text=""
            return datePickerCell

        }
        else{
            return cell //super.tableView(tableView, cellForRowAt: indexPath)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section==0 && indexPath.row==0{
            //showDatePicker()
            
        }
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        //if indexPath.section==0 && indexPath.row==0{
            return indexPath
        //}else{
        //    return nil
       //}
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
