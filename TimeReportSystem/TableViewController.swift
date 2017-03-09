//
//  TableViewController.swift
//  TimeReportSystem
//
//  Created by ADSI Intern III on 2/2/17.
//  Copyright © 2017 ADSI. All rights reserved.
//
import Foundation
import UIKit
import Alamofire

var numRows=Int()
var entryDict:NSMutableArray=[]
var Array:Dictionary<String, AnyObject>=[:]
var projectInfo:Dictionary<String, AnyObject>=[:]
var adsiprojectName:[String] = []
var projectStatus:[String] = []
var entryIDList:[String]=[]

class TableViewController: UITableViewController,adsiTableViewDelegate {
    //var gameofthrone = ""
    //var nimei = Int()
    var entryIndex=0
    
    func displayLabel(controller:ViewController, didDisplayLabel welcomeLabel:UITextField) {
        //gameofthrone=welcomeLabel.text!
        print("welcome label:\(welcomeLabel.text)")
        
    }
    
    var entires:NSArray=[]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request(trsUrl+"timeEntries/", method: .get).responseJSON{response in switch response.result{
        case.success(let json):
            
            print("json: \(json)")
            //let entries = json as! NSArray
            print("numRows: \(numRows)")
            
            
        case.failure(let Error):
            print("\(Error)")
            }
        }
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
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
        // #warning Incomplete implementation, return the number of rows
        
        print("number of rows:\(numRows)")
        return Int(numRows)
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListItem", for: indexPath)
        
        // Configure the cell...
        let projectName=cell.viewWithTag(002) as!UILabel
        let entryID=cell.viewWithTag(001) as!UILabel
        let approveStatus=cell.viewWithTag(003) as!UILabel
        
        if (indexPath.row) == entryIndex{
            let entryDictElement = entryDict[entryIndex] as! Dictionary<String, AnyObject>
            print("entryDictElement:\(entryDictElement)")
            entryID.text = String(entryDictElement["id"] as! Int)
            let entryProject = entryDictElement["project"] as! Dictionary<String, AnyObject>
            projectName.text=entryProject["projectName"] as! String
            if (entryProject["status"] as! String == "Approved") {
                approveStatus.textColor=UIColor.blue
                approveStatus.text="Approved"
            }else if(entryProject["status"] as!String == "Rejected"){
                approveStatus.textColor=UIColor.red
                approveStatus.text="Rejected"
            }
            else{
                approveStatus.textColor=UIColor.orange
                approveStatus.text="In Processing"
            }
            entryIndex += 1
        }
        
        /*
        if (indexPath.row)  == entryIndex{
            
            entryID.text=entryIDList[entryIndex]
            projectName.text=adsiprojectName[entryIndex]
            
            if (projectStatus[entryIndex] == "Approved") {
                approveStatus.textColor=UIColor.blue
                approveStatus.text="Approved"
            }else if(projectStatus[entryIndex] == "Rejected"){
                approveStatus.textColor=UIColor.red
                approveStatus.text="Rejected"
            }
            else{
                approveStatus.textColor=UIColor.orange
                approveStatus.text="In Processing"
            }
            entryIndex += 1
            
        }
        */
        
        return cell
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "ListItem", for: indexPath)
     
     // Configure the cell...
        let projectName=cell.viewWithTag(002) as!UILabel
        let entryID=cell.viewWithTag(001) as!UILabel
        let approveStatus=cell.viewWithTag(003) as!UILabel
        
        if (indexPath.row)  == entryIndex{
            //entryID.text=String(Array["id"] as! Int)
            entryID.text=entryIDList[entryIndex]
            projectName.text=adsiprojectName[entryIndex]
            
            if (projectStatus[entryIndex] == "Approved") {
                approveStatus.textColor=UIColor.blue
                approveStatus.text="Approved"
            }else if(projectStatus[entryIndex] == "Rejected"){
                approveStatus.textColor=UIColor.red
                approveStatus.text="Rejected"
            }
            else{
                approveStatus.textColor=UIColor.orange
                approveStatus.text="In Processing"
            }
            entryIndex += 1
            
        }
     return cell
     }
    */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let cell=tableView.cellForRow(at: indexPath)
        let entryDictElement = entryDict[indexPath.row] as! Dictionary<String, AnyObject>
        let entryProject = entryDictElement["project"] as! Dictionary<String, AnyObject>

        
        entryDetails.append(entryDictElement["date"] as! String)
        entryDetails.append(entryProject["status"] as! String)
        entryDetails.append(entryDictElement["comment"] as! String)
        /*
        entryDetails.append(entryDate[indexPath.row])
        entryDetails.append(projectStatus[indexPath.row])
        entryDetails.append(entryComment[indexPath.row])
        */
            
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NavEntry" {
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! ViewController
            
            controller.delegate = self
        }
    }
 
 
    
    
    
    /*
    func welcome(text: String)->String{
        gameofthrone=text
        return gameofthrone
    }

    
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
