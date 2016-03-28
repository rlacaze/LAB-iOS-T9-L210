//
//  RestApiManager.swift
//  LOG210-App-iOS-2.0
//
//  Created by Romain LACAZE on 16-03-21.
//  Copyright © 2016 Romain LACAZE. All rights reserved.
//

import Foundation

typealias ServiceResponse = (JSON, NSError?) -> Void

class RestApiManager: NSObject {

    static let sharedInstance = RestApiManager()
    let baseURL = "http://livreechangerest20160318115916.azurewebsites.net/api/tbl_livre/"
    
    func getRandomUser(onCompletion: (JSON) -> Void) {
        let route = baseURL
        makeHTTPGetRequest(route, onCompletion: { json, err in
            onCompletion(json as JSON)
        })
    }
    
    func makeHTTPGetRequest(path: String, onCompletion: ServiceResponse) {
        let request = NSMutableURLRequest(URL: NSURL(string: path)!)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            let json:JSON = JSON(data!)
            onCompletion(json, error)
        })
        task.resume()
    }
}