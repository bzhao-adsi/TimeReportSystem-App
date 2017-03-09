//
//  ViewController.swift
//  TimeReportSystem
//
//  Created by ADSI Intern III on 2/1/17.
//  Copyright © 2017 ADSI. All rights reserved.
//

import UIKit
import Alamofire

var bing=""
var trsUrl="localhost:50002"
var userset=("Id","UserName","Password","FirstName","LastName","Email","Role")

var userName=""
var userID:String="123"
var userPassword:String="123"

protocol adsiTableViewDelegate:class{
    func displayLabel(controller:ViewController, didDisplayLabel welcomeLabel:UITextField)
}

class ViewController: UIViewController {
    weak var delegate: adsiTableViewDelegate?
    
    var currentValue:String = "Log in failed: "
    var targetValue:String = "Please Enter Correct User Name or Password"
    var isUserLoggedIn:Bool=false



    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("http://gank.io/api/data/Android/10/1", method: .get, parameters: ["_id": "58a50780421aa9662dc74098"]).responseJSON {response in switch response.result{
        case.success(let json):
            //print(response.request)
            print("json: \(json)")
            let dict = json as! Dictionary<String,AnyObject>
            print("SIRI\(dict["results"])")
            //let resultDict = try JSONSerialization.jsonObject(with: dict["results"]) as? string
            //let resultDict=dict["results"] as!Dictionary<String,AnyObject>
            //let userID = resultDict["_id"] as? [String]
            //let Used = resultDict["used"] as! Bool
            //print("ID: \(userID)")
            //print("Used:\(Used)")
        case.failure(let Error):
            print("\(Error)")
        }
        }
        
        /*
        Alamofire.request("http://gank.io/api/day/history").responseJSON{response in switch response.result{
        case.success(let json):
            //print(response.request)
                print("json: \(json)")
                let dict = json as! Dictionary<String,AnyObject>
                let results = dict["results"] as? [String]
                let Terror = dict["error"] as! Bool
                print("results: \(results)")
                print("error:\(Terror)")
        case.failure(let Error):
            print("\(Error)")
            }
        }
        
        
        Alamofire.request("http://gank.io/api/data/Android/10/1").responseJSON{response in
        print(response.result)
        if let JSON = response.result.value{
          print("JSON: \(JSON)")
            }
        }
    
        */// Do any additional setup after loading the view, typically from a nib.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clique(_ sender: Any) {
        welcomelabel.text="Hi \(userIDField.text!)!"
    }

    @IBOutlet weak var welcomelabel: UILabel!
    @IBOutlet weak var userIDField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
 
    @IBAction func LoginTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Status", message:
            " \(currentValue)" +  "\(targetValue)" , preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        isUserLoggedIn = (userIDField.text == userID) && (passwordField.text==userPassword)
        
        
        /*
        let myvc = storyboard?.instantiateViewController(withIdentifier: "SecondVC")as! TableViewController
        myvc.gameofthrone="shenmegui!"//userIDField.text!
        //myvc.nimei=666
        self.navigationController?.pushViewController(myvc, animated: true)
        //navigationController?.pushViewController(myvc, animated: true)
       
        if (isUserLoggedIn) {
            delegate?.displayLabel(controller: self, didDisplayLabel: userIDField)
         
        }
        */
        
        bing=userIDField.text!
        if(!isUserLoggedIn){
            self.present(alertController, animated: true, completion: nil)
        }
        
       //TableController.welcome(text: userID)
        
        
        
    }
    
 
}

