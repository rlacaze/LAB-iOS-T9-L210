//
//  menuGestionnaire.swift
//  LOG210-App-iOS-2.0
//
//  Created by Romain LACAZE on 2016-03-09.
//  Copyright © 2016 Romain LACAZE. All rights reserved.
//

import UIKit

class menuGestionnaire: UIViewController {
    
    var idUser: String?
    
    @IBOutlet weak var remisebutton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //titre nav bar
        self.title = "Menu gestionnaire"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func remisebuttonaction(sender: AnyObject) {
        
        let listview = self.storyboard?.instantiateViewControllerWithIdentifier("remiseID") as! remise_search2
        listview.idUser = self.idUser! as String
        self.navigationController?.pushViewController(listview, animated: true)
    }
}