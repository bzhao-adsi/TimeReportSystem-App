//
//  EntryUpdateViewController.swift
//  TimeReportSystem
//
//  Created by ADSI Intern III on 2/17/17.
//  Copyright © 2017 ADSI. All rights reserved.
//

import UIKit
import Alamofire



class EntryUpdateViewController: UIViewController {

    
    @IBOutlet weak var userNameLabel: UITextField!
    @IBOutlet weak var firstNameLabel: UITextField!
    @IBOutlet weak var lastNameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    

    
    
    @IBAction func UpdateAccount(_ sender: Any) {
        
        let accountUpdateParameters:Parameters=[
            "Id":userID,
            "userName": userNameLabel.text!,
            "password":passwordLabel.text!,
            "firstName":firstNameLabel.text!,
            "lastName":lastNameLabel.text!,
            "email":emailLabel.text!
        ]
        Alamofire.request("http://adsitimereport.azurewebsites.net/api/users/"+userID, method: .put, parameters: accountUpdateParameters )
        
        let alertController = UIAlertController(title: "Status", message:
            "It been Updated! " , preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default,handler: nil))
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text=userAccountInfo[0]
        firstNameLabel.text=userAccountInfo[1]
        lastNameLabel.text=userAccountInfo[2]
        passwordLabel.text=userAccountInfo[3]
        emailLabel.text=userAccountInfo[4]

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
