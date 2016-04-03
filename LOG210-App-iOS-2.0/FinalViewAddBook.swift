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
    
    
    @IBOutlet weak var titre: UILabel!
    @IBOutlet weak var auteur: UILabel!
    @IBOutlet weak var nbPages: UILabel!
    @IBOutlet weak var prixNeuf: UILabel!
    @IBOutlet weak var isbn10: UILabel!
    @IBOutlet weak var isbn13: UILabel!
    
    override func viewDidLoad() {
        
        
        parseJson(data!)
        super.viewDidLoad()
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func parseJson(dataBrut: NSString) {
    
        
        var dataString: String
        dataString = dataBrut as String
        print(dataString)
        //let dataArray: [String]
        
        //let dataArray = dataString.characters.split(",")
        let dataArray = dataString.componentsSeparatedByString(",")
        
        let dataTitre = dataArray[3].componentsSeparatedByString(":")
        let dataAuteur = dataArray[4].componentsSeparatedByString(":")
        let dataNbPages = dataArray[5].componentsSeparatedByString(":")
        let dataPrixNeuf = dataArray[6].componentsSeparatedByString(":")
        let dataIsbn10 = dataArray[7].componentsSeparatedByString(":")
        let dataIsbn13 = dataArray[8].componentsSeparatedByString(":")

        titre.text = dataTitre[1]
        auteur.text = "par \(dataAuteur[1])"
        nbPages.text = "\(dataNbPages[1]) pages"
        prixNeuf.text = " Neuf: \(dataPrixNeuf[1]) $"
        isbn10.text = " ISBN10: \(dataIsbn10[1])"
        isbn13.text = " ISBN13: \(dataIsbn13[1])"
        
        /*
        print(dataTitre[1])
        print(dataAuteur[1])
        print("\(dataNbPages[1]) pages")
        print(" Prix de vente: \(dataPrixNeuf[1]) $")
        print(" ISBN10: \(dataIsbn10[1])")
        print(" ISBN13: \(dataIsbn13[1])")
        */
        
        
    }
 
    
}