//
//  EntryAddController.swift
//  TimeReportSystem
//
//  Created by ADSI Intern III on 2/8/17.
//  Copyright © 2017 ADSI. All rights reserved.
//

import UIKit
import Alamofire

let entryParameters:Parameters=["Id":"",//Int()
    "Date":"",//Datetime
    "WorkTime":"",//Double
    "Comment":"",//string
    "Status":"",//StatusType
    "Project":"",//ProjectDto
    "User":""//UserDto
]


class EntryAddController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("https://trs.com/api/timeEntries", method: .post, parameters: entryParameters)
        // Do any additional setup after loading the view.
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
    
    @IBOutlet weak var Submit: UIButton!
    @IBOutlet weak var entryDateLabel: UITextField!
    
    var entryDate=NSDate()

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var Calendar: UIDatePicker!
    @IBAction func Date(_ sender: Any) {
        
        Calendar.isHidden=false
        Submit.isHidden=true
    }
    
    @IBAction func EndEdit(_ sender: Any) {
        Calendar.isHidden=true
        Submit.isHidden=false
        entryDate=Calendar.date as NSDate
        //Calendar.setDate(entryDate as Date, animated: false)
        
        updateDateLabel()
        //entryDateLabel.text = formatter.string(from: entryDate as Date)
        
    }

    func updateDateLabel() {
        let formatter = DateFormatter()
        
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        entryDateLabel.text = formatter.string(from: entryDate as Date)
        
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
