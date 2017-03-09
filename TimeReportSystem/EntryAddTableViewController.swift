//
//  EntryAddTableViewController.swift
//  TimeReportSystem
//
//  Created by ADSI Intern III on 3/1/17.
//  Copyright © 2017 ADSI. All rights reserved.
//
import Foundation
import UIKit
import Alamofire

var projectDict:NSArray = []
var userDict:NSArray=[]
var entryAddDict:Dictionary<String, AnyObject>=[:]
var userAddDict:Dictionary<String, Any>=[:]
var projectAddDict:Dictionary<String, Any>=[:]


class EntryAddTableViewController: UITableViewController {


    @IBOutlet weak var datePickerCell: UITableViewCell!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var WorkTimeLabel: UILabel!
    
    var datePickerVisible=false
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.text=userNameList[userList.index(of: userID)!]
        updateDateLabel()
        updateWorkTime(workTime: workTime)

    }
    
    func updateWorkTime(workTime: String){
        WorkTimeLabel.text = workTime
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
 
    func showDatePicker(){
        datePickerVisible=true
        let indexPathdatePicker=IndexPath(row: 3, section: 1)
        
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPathdatePicker], with: .fade)
        tableView.endUpdates()
        
    }

    
    @IBAction func Cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Done(_ sender: Any) {
        print(dateLabel.text!)
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        let newEntryParameters:Parameters=[
            "date": dateLabel.text,
            "workTime": workTime,
            "comment": "",
            "status": 0,
            "project":projectAddDict,
            "user":userAddDict
        ]
        
        print("projectAddDict: \(newEntryParameters)")
        
        Alamofire.request("http://adsitimereport.azurewebsites.net/api/timeEntries", method: .post, parameters: newEntryParameters, encoding: JSONEncoding.default).response { response in
            print("Request: \(response.request)")
            print("Response: \(response.response)")
            print("Error: \(response.error)")
            
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)")
            }
        }
        
        workTime=""
        dismiss(animated: true, completion: nil)
    }
    
    func hideDatePicker(){
        
        if datePickerVisible{
            datePickerVisible=false
            let indexPathDatePicker = IndexPath(row:3, section:1)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPathDatePicker], with: .fade)
            tableView.endUpdates()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section==1 && datePickerVisible{
        return 4
        }
        else if section==1 && datePickerVisible==false{
            return 3
        }
        else {
            return super.tableView(tableView, numberOfRowsInSection: section)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        //return cell
        if indexPath.section==1 && indexPath.row==3 && datePickerVisible{
            return datePickerCell
        } else {
        return super.tableView(tableView, cellForRowAt: indexPath)
        }


    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section==1 && indexPath.row==3 {
            return 217
        }
        else{
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section==1 && indexPath.row==2{
            if datePickerVisible{
                hideDatePicker()
            }else if datePickerVisible==false{
                showDatePicker()
                print(datePickerVisible)
            }

            
        }
    }
    
    func updateDateLabel() {
        let formatter = DateFormatter()
        
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        dateLabel.text = formatter.string(from: datePicker.date as Date)
        
    }
    
    @IBAction func dateChanged(datePicker: UIDatePicker){
        updateDateLabel()
    }
    
    /*
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.section==1 && indexPath.row==0{
        return indexPath
        }else{
            return nil
        }
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
