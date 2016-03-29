//
//  aProposDetails.swift
//  LOG210-App-iOS-2.0
//
//  Created by Romain LACAZE on 2016-03-10.
//  Copyright © 2016 Romain LACAZE. All rights reserved.
//

import UIKit

class aProposDetails: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var image = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView.image = self.image
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
