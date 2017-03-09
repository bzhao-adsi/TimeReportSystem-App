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
                numRows=0
                
            
                while self.entryIndex < entries.count {
                    Array = entries[self.entryIndex] as! Dictionary<String, AnyObject>
                        let userInfo = Array ["user"] as! Dictionary <String, AnyObject>
                    if (String(userInfo["userName"] as! String) == userNameList[userList.index(of: userID)!]){
                        entryDict.add(entries[self.entryIndex] as! AnyObject)
                        
                        print("entries[self.entryIndex]:\(entries[self.entryIndex])")
                        print("entryDict:\(entryDict)")
                        print("entrycounts:\(entryDict.count)")
                        
                        //Update Account Information at EntryUpdateViewController
                        userAccountInfo=[userInfo["userName"] as! String,userInfo["firstName"] as! String,userInfo["lastName"] as! String,userInfo["password"] as! String,userInfo["email"] as! String]
                        //Send Users Informaiton to Entry Add Controller
                        userAddDict=userInfo
                        
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
    @IBOutlet weak var userIDField: UITextField!
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
        
    }    
 
}


 
 
 
 /// Do any additional setup after loading the view, typically from a nib.

