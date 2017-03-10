//
//  EntryDeleteViewController.swift
//  TimeReportSystem
//
//  Created by ADSI Intern III on 2/17/17.
//  Copyright © 2017 ADSI. All rights reserved.
//

import UIKit
import Alamofire

var entryDetails:[String]=[]
var entryUserName:String=""
var entryComment:[String]=[]
var entryDate:[String]=[]
var entryDeleteId=Int()


class EntryDeleteViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var DateTextField: UITextField!
    @IBOutlet weak var statusTextField: UITextField!
    @IBOutlet weak var commentTextField: UITextField!
    
    @IBAction func deleteEntry(_ sender: Any) {
        let deleteEntryParameters:Parameters=[
            "id": entryDeleteId
        ]
        
        Alamofire.request("http://adsitimereport.azurewebsites.net/api/timeEntries", method: .delete, parameters: deleteEntryParameters ).response { response in
            print("Request: \(response.request)")
            print("Response: \(response.response)")
            print("Error: \(response.error)")
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)")
            }
        }
        
        let alertController = UIAlertController(title: "Status", message:
            "Entry has been deleted! " , preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default,handler: nil))
        self.present(alertController, animated: true, completion: nil)
        
        let TVC = TableViewController()
        TVC.cancel()
        
        //let TVC = TableViewController()
        //TVC.tableViewUpdate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DateTextField.text=entryDetails[0]
        statusTextField.text=entryDetails[1]
        commentTextField.text=entryDetails[2]
        //userNameTextField.text=entryUserName
        userNameTextField.text=userNameList[userList.index(of: userID)!]
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
