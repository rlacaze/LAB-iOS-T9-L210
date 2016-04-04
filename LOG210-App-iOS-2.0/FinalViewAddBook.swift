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
    
    @IBAction func terminerbouton(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func parseJson(dataBrut: NSString) {
    
        
        var dataString: String
        dataString = dataBrut as String
        print(dataString)
        //let dataArray: [String]
        
        //let dataArray = dataString.characters.split(",")
        let dataArray = dataString.componentsSeparatedByString("\"")
        
        /*
        let dataTitre = dataArray[3].componentsSeparatedByString(":")
        let dataAuteur = dataArray[4].componentsSeparatedByString(":")
        let dataNbPages = dataArray[5].componentsSeparatedByString(":")
        let dataPrixNeuf = dataArray[6].componentsSeparatedByString(":")
        let dataIsbn10 = dataArray[7].componentsSeparatedByString(":")
        let dataIsbn13 = dataArray[8].componentsSeparatedByString(":")
        */
        
        
        titre.text = dataArray[11]
        auteur.text = "par \(dataArray[15])"
        nbPages.text = "\(dataArray[19]) pages"
        prixNeuf.text = "Neuf: \(dataArray[23]) $"
        isbn10.text = "ISBN10: \(dataArray[27])"
        isbn13.text = "ISBN13: \(dataArray[31])"
        
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