//
//  TimeEntryView.swift
//  TimeReportSystem
//
//  Created by ADSI Intern III on 2/1/17.
//  Copyright © 2017 ADSI. All rights reserved.
//

import UIKit

class TimeEntryView: UITableViewController {

    @IBOutlet weak var Entry: UILabel!
    @IBOutlet weak var Project: UILabel!
    @IBOutlet weak var Status: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int{
        return 3
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) //as! CustomCell
        
        //cell.Status.text="123"
        
        return cell
    }


    //override func tableView (tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)->UITableViewCell{
    //    let cell = tableView.dequeueReusableCell(withIdentifier: "ListItem", for: IndexPath)
    //}

 
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    //@IBOutlet weak var label: UILabel!
    ///@IBOutlet weak var Entry: UITableViewCell!
    //@IBOutlet weak var Project: UITableViewCell!
    //@IBOutlet weak var Status: UITableViewCell!

    
}
