//
//  home.swift
//  LOG210-App-iOS-2.0
//
//  Created by Romain LACAZE on 2016-03-01.
//  Copyright © 2016 Romain LACAZE. All rights reserved.
//

import UIKit

class home: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //titre nav bar
        //self.title = "menu principal"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //PROPERTIES
    @IBOutlet weak var labelTitre: UILabel!
    @IBOutlet weak var labelTitre2: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var aProposButton: UIButton!
    
    
    //ACTIONS
    @IBAction func loginButtonAction(sender: UIButton) {
    }
    
    @IBAction func aProposButtonAction(sender: UIButton) {
    }
    
}