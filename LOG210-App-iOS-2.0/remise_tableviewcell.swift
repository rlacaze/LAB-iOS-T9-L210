//
//  remise_tableviewcell.swift
//  LOG210-App-iOS-2.0
//
//  Created by Romain LACAZE on 16-04-03.
//  Copyright © 2016 Romain LACAZE. All rights reserved.
//

//
//  remise_search2.swift
//  LOG210-App-iOS-2.0
//
//  Created by Romain LACAZE on 2016-03-09.
//  Copyright © 2016 Romain LACAZE. All rights reserved.
//

import UIKit

class remise_tableviewcell: UITableViewController {
    @IBOutlet weak var cell: UITableViewCell!
    
    var idUser: String?
    var data: NSString?
    var items = ["one","two"]
    var nbLivres: Int = 0
    var dataArray: [String] = []
    var dataTitle: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //titre nav bar
        self.title = "Resultats"
        
        data = checkingApi()
        //print(data!)
        
        parseJson(data!)
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataTitle.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.tableView
            .dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        cell.textLabel?.text = dataTitle[indexPath.row]
        return cell
    }
    
    
    
    
    func parseJson(dataBrut: NSString) {
        
        var dataString: String
        dataString = dataBrut as String
        //print(dataString)
        //let dataArray: [String]
        
        dataArray = dataString.componentsSeparatedByString("\"")
        
        var count: Int
        
        for count = 7; count <= dataArray.count; count = count + 10 {
            dataTitle.append(dataArray[count])
            nbLivres += 1
        }
        print("\(nbLivres) livres")
    }
    
    
    
    func checkingApi() -> NSString{
        
        var result: NSString = ""
        
        let headers = [
            "cache-control": "no-cache",
            "postman-token": "6b9b9816-6dae-aade-504a-9545ec1baef2"
        ]
        
        
        idUser = idUser!.stringByReplacingOccurrencesOfString("\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        let url: NSURL = NSURL(string: "http://livreechangerest20160318115916.azurewebsites.net/api/tbl_exemplaireLivre/Post_ExemplaireEtudiantNonRecu/?IdUser=\(idUser!)")!
        
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
                //print("strData: \(strData)")
                result = strData
            }
        })
        
        
        dataTask.resume()
        sleep(2)
        return result
    }
    
    
    
    
}