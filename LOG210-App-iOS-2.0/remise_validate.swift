//
//  remise_validate.swift
//  LOG210-App-iOS-2.0
//
//  Created by Romain LACAZE on 2016-03-09.
//  Copyright © 2016 Romain LACAZE. All rights reserved.
//

import UIKit

class remise_validate: UIViewController {
    
    
    @IBOutlet weak var titreLivre: UILabel!
    @IBOutlet weak var idLivre: UILabel!
    @IBOutlet weak var etat: UILabel!
    
    var idUser: String?
    var id: Int?
    var dataTitle: [String] = []
    var dataIdExmplaireLivre: [String] = []
    var dataEtat: [String] = []
    
    @IBOutlet weak var buttoncancel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttoncancel.hidden = true
        // Do any additional setup after loading the view, typically from a nib.
        //titre nav bar
        self.title = "Remise"
        titreLivre.text = self.dataTitle[id!]
        etat.text = "Livre dans un état \(typeEtatString(cleanData(dataEtat[id!])))"
        idLivre.text = "Numéro d'enregistrement \(cleanData(dataIdExmplaireLivre[id!]))"
    }
    
    func typeEtatString(id: String) -> String {
        var result: String

        if (id == "1") {
            result = "comme neuf"
        } else {
            if (id == "2") {
                result = "correct"
            } else {
                result = "usagé"
            }
        }
        
        return result
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cleanData(databrut: String) -> String {
        var dataclean: String
        dataclean = databrut.stringByReplacingOccurrencesOfString(":", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        dataclean = dataclean.stringByReplacingOccurrencesOfString(" ", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        dataclean = dataclean.stringByReplacingOccurrencesOfString(",", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        dataclean = dataclean.stringByReplacingOccurrencesOfString("{", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        dataclean = dataclean.stringByReplacingOccurrencesOfString("}", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        dataclean = dataclean.stringByReplacingOccurrencesOfString("]", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)

        return dataclean
    }
    
    @IBAction func acceptButton(sender: AnyObject) {
        checkingApi("Post_ValiderRemise")
        let finalGestionnaire = storyboard!.instantiateViewControllerWithIdentifier("finalGestionnaireViewID") as! finalGestionnaireView
        finalGestionnaire.fonction = "remise"
        finalGestionnaire.statut = "validé"
        finalGestionnaire.titre = self.dataTitle[id!]

        self.navigationController?.pushViewController(finalGestionnaire, animated: true)
    }
    
    @IBAction func cancelButton(sender: AnyObject) {
        checkingApi("Post_RefuserRemise")
        let finalGestionnaire = storyboard!.instantiateViewControllerWithIdentifier("finalGestionnaireViewID") as! finalGestionnaireView
        finalGestionnaire.fonction = "remise"
        finalGestionnaire.statut = "refusé"
        finalGestionnaire.titre = self.dataTitle[id!]

        self.navigationController?.pushViewController(finalGestionnaire, animated: true)
    }
    
    func checkingApi(param: String) -> NSString{
        
        var result: NSString = ""
        
        let headers = [
            "cache-control": "no-cache",
            "postman-token": "6b9b9816-6dae-aade-504a-9545ec1baef2"
        ]
        
        
        //idUser = idUser!.stringByReplacingOccurrencesOfString("\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        let url: NSURL = NSURL(string: "http://livreechangerest20160318115916.azurewebsites.net/api/tbl_exemplaireLivre/\(param)/?idExemplaire=\(cleanData(dataIdExmplaireLivre[id!]))")!
        print(url)
        
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
                result = strData
            }
        })
        
        
        dataTask.resume()
        sleep(1)
        
        return result
    }

}