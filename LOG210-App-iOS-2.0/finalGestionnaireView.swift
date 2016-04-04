//
//  finalGestionnaireView.swift
//  LOG210-App-iOS-2.0
//
//  Created by Romain LACAZE on 16-04-04.
//  Copyright © 2016 Romain LACAZE. All rights reserved.
//

import UIKit

class finalGestionnaireView: UIViewController {
    
    var idUser: String?
    var fonction: String?
    var statut: String?
    var titre: String?
    
    @IBOutlet weak var labelfinal: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Validation"
        //titre nav bar
        
        self.labelfinal.text = "La \(fonction!) du livre \(titre!) à été \(statut!)"
        //print("idUserAdd \(idUser)")
        
        
    }
    
    @IBAction func bouttonterminer(sender: AnyObject) {
        
        //let gestionnaire = self.storyboard?.instantiateViewControllerWithIdentifier("newGestionnaire") as! menuGestionnaire
        //self.navigationController?.pushViewController(gestionnaire, animated: true)
        //navigationController?.popToViewController(gestionnaire, animated: true)
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}