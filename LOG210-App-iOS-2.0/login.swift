//
//  login.swift
//  LOG210-App-iOS-2.0
//
//  Created by Romain LACAZE on 2016-03-01.
//  Copyright © 2016 Romain LACAZE. All rights reserved.
//

import Foundation
import UIKit

class login: UIViewController, UITextFieldDelegate {
    
    //properties
    @IBOutlet weak var identifiant: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var Switch: UISwitch!
    @IBOutlet weak var validerButton: UIButton!
    
    //func
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        //titre nav bar
        self.title = "identification"
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //actions
    @IBAction func validerAction(sender: UIButton) {
        identifiant.resignFirstResponder()
    }
    
    //ferme le clavier avec le bouton "retour"
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        
        return true
        
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    
    
    //ACTION
    @IBAction func validation(sender: UIButton) {
       
        checkingApi(identifiant.text!, password: password.text!)
        
    }
    
    func checkingApi(identifiant: String, password: String){
        print("id=\(identifiant) : pass=\(password)")
        
        let headers = [
            "cache-control": "no-cache",
            "postman-token": "6b9b9816-6dae-aade-504a-9545ec1baef2"
        ]
        
        var url: NSURL = NSURL(string: "http://livreechangerest20160318115916.azurewebsites.net/api/tbl_user?email=\(identifiant)&password=\(password)")!
       
        let request:NSMutableURLRequest = NSMutableURLRequest(URL:url)
        
        request.HTTPMethod = "POST"
        request.allHTTPHeaderFields = headers
        
        let session = NSURLSession.sharedSession()
        let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? NSHTTPURLResponse
                var strData = NSString(data: data!, encoding: NSUTF8StringEncoding)!
                print("Body: \(strData)")
            }
        })
        
        dataTask.resume()
    }
    
    
    
}