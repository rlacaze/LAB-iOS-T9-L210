//
//  viewList.swift
//  LOG210-App-iOS-2.0
//
//  Created by Romain LACAZE on 2016-03-01.
//  Copyright © 2016 Romain LACAZE. All rights reserved.
//

import UIKit

class viewList: UIViewController {
    var idUser: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //titre nav bar
        self.title = "liste des livres"
        //print("idUserAdd \(idUser)")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextView(sender: AnyObject) {
        let liste = storyboard!.instantiateViewControllerWithIdentifier("barecodeReaderID") as! barcodeReader
        liste.idUser = self.idUser
        self.navigationController?.pushViewController(liste, animated: true)
    }
    
}