//
//  aProposController.swift
//  LOG210-App-iOS-2.0
//
//  Created by Romain LACAZE on 2016-03-15.
//  Copyright © 2016 Romain LACAZE. All rights reserved.
//

import UIKit

class aProposController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let clubs = ["ace", "applets", "aeets"]
    let imageArray = [UIImage(named: "ic_ace"), UIImage(named: "ic_applets"), UIImage(named: "ic_aeets")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.clubs.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell
        
        cell.imageView?.image = self.imageArray[indexPath.row]
        //cell.titleLabel?.text = self.clubs[indexPath.row]
        
        return cell
        
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("showImage", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showImage"
        {
            let indexPaths = self.collectionView!.indexPathsForSelectedItems()!
            let indexPath = indexPaths[0] as NSIndexPath
        
            let vc = segue.destinationViewController as! aProposDetails
        
            vc.image = self.imageArray[indexPath.row]!
            //vc.title = self.clubs[indexPath.row]
            
        }
        
        
    }


    
    
}
