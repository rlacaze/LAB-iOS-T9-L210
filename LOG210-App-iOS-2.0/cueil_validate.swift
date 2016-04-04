//
//  cueil_validate.swift
//  LOG210-App-iOS-2.0
//
//  Created by Romain LACAZE on 2016-03-09.
//  Copyright © 2016 Romain LACAZE. All rights reserved.
//

import UIKit

class cueil_validate: UIViewController {
    
    var idUser: String?
    var id: Int?
    var dataTitle: [String] = []
    var dataIdExmplaireLivre: [String] = []
    var studentName: [String] = []
    
    @IBOutlet weak var reservedBy: UILabel!
    @IBOutlet weak var idLivre: UILabel!
    @IBOutlet weak var titreLivre: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //titre nav bar
        self.title = "Cueillir"
        
        titreLivre.text = self.dataTitle[id!]
        reservedBy.text = "Réservé par \(self.studentName[id!])"
        idLivre.text = "Numéro d'enregistrement \(cleanData(dataIdExmplaireLivre[id!]))"

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cleanData(databrut: String) -> String {
        var dataclean: String
        dataclean = databrut.stringByReplacingOccurrencesOfString(":", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
        dataclean = dataclean.stringByReplacingOccurrencesOfString(" ", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
        dataclean = dataclean.stringByReplacingOccurrencesOfString(",", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
        dataclean = dataclean.stringByReplacingOccurrencesOfString("{", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
        dataclean = dataclean.stringByReplacingOccurrencesOfString("}", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
        dataclean = dataclean.stringByReplacingOccurrencesOfString("]", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        return dataclean
    }

}