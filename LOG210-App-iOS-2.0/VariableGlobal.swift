//
//  VariableGlobal.swift
//  LOG210-App-iOS-2.0
//
//  Created by Romain LACAZE on 16-03-29.
//  Copyright © 2016 Romain LACAZE. All rights reserved.
//

import Foundation


class VariableGlobal {
    
    class var sharedInstance: VariableGlobal {
        struct Static {
            static var instance: VariableGlobal?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = VariableGlobal()
        }
        
        return Static.instance!
    }
    
    var idUser: String?

}