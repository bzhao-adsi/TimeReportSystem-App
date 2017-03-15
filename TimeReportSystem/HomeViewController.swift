//
//  HomeViewController.swift
//  TimeReportSystem
//
//  Created by ADSI Intern III on 3/15/17.
//  Copyright © 2017 ADSI. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showEntryView(_ sender: Any) {
        entryDict.removeAllObjects()
        
        let VC = ViewController()
        VC.entryIndex=0
        VC.numOfRows()
        sleep(3)
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
