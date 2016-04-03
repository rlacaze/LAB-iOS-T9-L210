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
    @IBOutlet weak var prixLabel: UILabel!
    var etat: Int!
    @IBOutlet weak var nbPages: UITextField!
    @IBOutlet weak var nbPagesLabel: UILabel!
    var isbn: String?
    var idUser: String?
    @IBOutlet weak var pickerState: UIPickerView! = UIPickerView()
    var listeEtat = ["Comme neuf","Bon état","Livre usagé"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //titre nav bar
        self.title = "résultat"
        isbnFieldText.text = isbn
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(login.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        pickerState.hidden = false
        etat = 1
        
        idUser = idUser!.stringByReplacingOccurrencesOfString("\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //actions
    @IBAction func validerAction(sender: UIButton) {
        isbnFieldText.resignFirstResponder()
    }
    
    //ferme le clavier avec le bouton "retour"
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    //ferme le clavier avec un tap hors du clavier
    func dismissKeyboard() {
        view.endEditing(true)
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int{
        return listeEtat.count
    }
    
    func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String! {
        return listeEtat[row]
    }
    
    func pickerView(pickerView: UIPickerView!, didSelectRow row: Int, inComponent component: Int)
    {
        etat = row+1
        pickerState.hidden = false;
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        pickerState.hidden = false
        return false
    }
    
    
    @IBAction func addButtonAction(sender: AnyObject) {
        print("isbn=\(isbn!) : state=\(etat) : price=\(prix.text!) : nbpages=\(nbPages.text!) : id=\(idUser!)")
        
        if prix.text == "" || nbPages.text == "" {
            if prix.text == "" {
                prixLabel.textColor = UIColor.redColor()
            } else {
                prixLabel.textColor = UIColor.blackColor()
            }
            if nbPages.text == "" {
                nbPagesLabel.textColor = UIColor.redColor()
            } else {
                nbPagesLabel.textColor = UIColor.blackColor()
            }
        } else {
            prixLabel.textColor = UIColor.blackColor()
            nbPagesLabel.textColor = UIColor.blackColor()
            
            var data: NSString
            data = checkingApi()
            
            let finalView = storyboard!.instantiateViewControllerWithIdentifier("finalViewAddBookStoryboardID") as! FinalViewAddBook
            finalView.data = data
            self.navigationController?.pushViewController(finalView, animated: true)
        }
        
        
    }
    
    func checkingApi() -> NSString{
        
        var result: NSString = ""
        
        let headers = [
            "cache-control": "no-cache",
            "postman-token": "6b9b9816-6dae-aade-504a-9545ec1baef2"
        ]
        
        let url: NSURL = NSURL(string: "http://livreechangerest20160318115916.azurewebsites.net/api/tbl_exemplaireLivre/Put_AjoutExemplaire/?ISBN=\(isbn!)&Prix=\(prix.text!)&Etat=\(etat)&NombrePages=\(nbPages.text!)&IdUser=\(idUser!)")!
        
        let request:NSMutableURLRequest = NSMutableURLRequest(URL:url)
        
        request.HTTPMethod = "PUT"
        request.allHTTPHeaderFields = headers
        
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                //let httpResponse = response as? NSHTTPURLResponse
                let strData = NSString(data: data!, encoding: NSUTF8StringEncoding)!
                //print("strData: \(strData)")
                result = strData
            }
        })
        
        
        dataTask.resume()
        sleep(2)
        return result
    }
}
