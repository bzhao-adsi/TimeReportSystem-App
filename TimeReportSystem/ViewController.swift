//
//  ViewController.swift
//  TimeReportSystem
//
//  Created by ADSI Intern III on 2/1/17.
//  Copyright © 2017 ADSI. All rights reserved.
//

import UIKit
import Alamofire


var trsUrl="http://adsitimereport.azurewebsites.net/api/"
var userset=("Id","UserName","Password","FirstName","LastName","Email","Role")

var userName=""
var userID:String!="123"
var userPassword:String!="123"
var userAccountInfo:[String]=[]
var userList:[String]=[]
var passwordList:[String]=[]
var userNameList:[String]=[]
var userIndex=0

protocol adsiTableViewDelegate:class{
    func displayLabel(controller:ViewController, didDisplayLabel welcomeLabel:UITextField)
}

class ViewController: UIViewController {
    weak var delegate: adsiTableViewDelegate?
    
    var currentValue:String = "Log in failed: "
    var targetValue:String = "Please Enter Correct User Name or Password"
    var isUserLoggedIn:Bool=false
    
    var entryIndex=0
    


    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("http://adsitimereport.azurewebsites.net/api/projects", method: .get).responseJSON{response in switch response.result{
        case.success(let json):
            projectDict = json as! NSArray
            print(projectDict[0])
        case.failure(let Error):
            print("\(Error)")
            }
        }
        
        
        findUser()
        
        }
    
    
    func findUser(){
            Alamofire.request("http://adsitimereport.azurewebsites.net/api/users", method: .get).responseJSON{response in switch response.result{
            case.success(let json):
                let dict = json as! NSArray
                while userIndex<dict.count {
                    let USR = dict[userIndex] as! Dictionary<String,AnyObject>
                    userList.append(String(USR["id"] as! Int))
                    passwordList.append((USR["password"] as? String)!)
                    userNameList.append(USR["userName"] as! String)
                    
                    userIndex+=1
                    //let userID= String(USR["id"] as! Int)
                    //let passwordList[userIndex] = USR["password"] as? String
                }
                
            case.failure(let Error):
                print("\(Error)")
                }
                userIndex=0
            }
        }
    
        func numOfRows(){
            Alamofire.request(trsUrl+"timeEntries/", method: .get).responseJSON{response in switch response.result{
            case.success(let json):
            
                print("json: \(json)")
                let entries = json as! NSArray
                //numRows=entries.count
                numRows=0
                
            
                while self.entryIndex < entries.count {
                    Array = entries[self.entryIndex] as! Dictionary<String, AnyObject>
                        let userInfo = Array ["user"] as! Dictionary <String, AnyObject>
                    if (String(userInfo["userName"] as! String) == userNameList[userList.index(of: userID)!]){
                        entryDict.add(entries[self.entryIndex] as! AnyObject)
                        //entryDict.addingObjects(from: [entries[self.entryIndex]])
                        
                        print("entries[self.entryIndex]:\(entries[self.entryIndex])")
                        print("entryDict:\(entryDict)")
                        print("entrycounts:\(entryDict.count)")
                        
                        /*
                        entryUserName = String(userInfo["id"] as! Int)
                        entryIDList.append(String(Array["id"] as! Int))
                        projectInfo = Array ["project"] as! Dictionary<String, AnyObject>
                        adsiprojectName.append(projectInfo["projectName"] as! String)
                        projectStatus.append(projectInfo["status"] as! String)
                        entryDate.append(Array["date"] as! String)
                        entryComment.append(Array["comment"] as! String)
                        userAccountInfo=[userInfo["userName"] as! String,userInfo["firstName"] as! String,userInfo["lastName"] as! String,userInfo["password"] as! String,userInfo["email"] as! String]
                        userAddDict=userInfo
                        */
                        
                        numRows+=1

                    }
                    
                    self.entryIndex += 1
                    print("userInfo: \(String(userInfo["id"] as! Int)) UserID :\(userID)")
                    
            }
                print("numRows: \(numRows)")

            case.failure(let Error):
                print("\(Error)")
            }
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func clique(_ sender: Any) {
        welcomelabel.text="Hi \(userIDField.text!)!"
    }

    @IBOutlet weak var welcomelabel: UILabel!
    @IBOutlet weak var userIDField:                                                                                      UITextField!
    @IBOutlet weak var passwordField: UITextField!
 
    @IBAction func LoginTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Status", message:
            " \(currentValue)" +  "\(targetValue)" , preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        
        isUserLoggedIn = (userList.contains(userIDField.text!)) && passwordList[userList.index(of: userIDField.text!)!] == passwordField.text
        userID=userIDField.text!
        
        //isUserLoggedIn = (userIDField.text == userID) && (passwordField.text==userPassword)
        self.numOfRows()
        sleep(3)
        
        if(!isUserLoggedIn && userList.contains(userIDField.text!)){
            self.present(alertController, animated: true, completion: nil)
        }
        
        
        
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

       //TableController.welcome(text: userID)
        
        
        
    }    
 
}

/*
 Alamofire.request("http://gank.io/api/data/Android/10/1", method: .get, parameters: ["_id": "58a50780421aa9662dc74098"]).responseJSON {response in switch response.result{
 case.success(let json):
 //print(response.request)
 print("json: \(json)")
 let dict = json as! Dictionary<String,AnyObject>
 print("SIRI\(dict["results"])")
 //let resultDict = try JSONSerialization.jsonObject(with: dict["results"]) as? string
 let resultDict=dict["results"] as?NSArray
 print(resultDict![0])
 let targetResult = resultDict![0] as? NSDictionary
 let userID = targetResult!["_id"] as? AnyObject
 print("ID: \(userID)")
 
 //let userID = resultDict["_id"] as? [String]
 //let Used = resultDict["used"] as! Bool
 //print("ID: \(userID)")
 //print("Used:\(Used)")
 
 Alamofire.request("https://gank.io/api/add2gank", method: .post, parameters: Parameters, encoding: JSONEncoding.default)
 
 case.failure(let Error):
 print("\(Error)")
 }
 }
 
 */

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
 
 
 
 
 */// Do any additional setup after loading the view, typically from a nib.

