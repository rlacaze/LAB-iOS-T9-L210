//
//  FinalViewAddBook.swift
//  LOG210-App-iOS-2.0
//
//  Created by Romain LACAZE on 16-04-02.
//  Copyright © 2016 Romain LACAZE. All rights reserved.
//

import UIKit

class FinalViewAddBook: UIViewController {
    
    var data: NSString?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(data!)
        
        //parseJson(data!)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    func parseJson(dataBrut: NSString) {
       
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            
            if let blogs = json["blogs"] as? [[String: AnyObject]] {
                for blog in blogs {
                    if let name = blog["name"] as? String {
                        names.append(name)
                    }
                }
            }
        } catch {
            print("error serializing JSON: \(error)")
        }
        
        print(names)
    }*/
}