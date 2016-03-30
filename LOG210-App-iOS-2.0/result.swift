//
//  result.swift
//  LOG210-App-iOS-2.0
//
//  Created by Romain LACAZE on 2016-03-03.
//  Copyright © 2016 Romain LACAZE. All rights reserved.
//

import UIKit

class result: UIViewController {
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var isbnFieldText: UITextField!
    @IBOutlet weak var prix: UITextField!
    @IBOutlet weak var etat: UITextField!
    @IBOutlet weak var nbPages: UITextField!
    var isbn: String?
    var idUser: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //titre nav bar
        self.title = "résultat"
        isbnFieldText.text = isbn
        print("idUserfinal \(idUser)")
        
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func addButtonAction(sender: AnyObject) {
        
        
        
        
    }
    
    func checkingApi(identifiant: String, password: String) -> Bool{
        print("id=\(identifiant) : pass=\(password)")
        var result: Bool = false
        
        let headers = [
            "cache-control": "no-cache",
            "postman-token": "6b9b9816-6dae-aade-504a-9545ec1baef2"
        ]
        
        let url: NSURL = NSURL(string: "http://livreechangerest20160318115916.azurewebsites.net/api/tbl_user?email=\(identifiant)&password=\(password)")!
        
        let request:NSMutableURLRequest = NSMutableURLRequest(URL:url)
        
        request.HTTPMethod = "POST"
        request.allHTTPHeaderFields = headers
        
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                //let httpResponse = response as? NSHTTPURLResponse
                let strData = NSString(data: data!, encoding: NSUTF8StringEncoding)!
                print("strData: \(strData)")
                //if (strData == "true"){
                if (strData != ""){
                    result = true
                    //print("result1: \(result)")
                } else {
                    result = false
                }
            }
        })
        
        
        dataTask.resume()
        
        sleep(2)
        //usleep(500000)
        return result
    }
}
