//
//  SteakCollectionViewController.swift
//  CollectionViewExercise
//
//  Created by 張智涵 on 2016/6/27.
//  Copyright © 2016年 張智涵 Vincent Chang. All rights reserved.
//

import UIKit

private let reuseIdentifier = "SteakCollectionImage"


class SteakCollectionViewController: UICollectionViewController {
    


    
    var steakImage =  ["steak1", "steak2", "steak3", "steak4", "steak5", "steak6", "steak7", "steak8", "steak9", "steak10"]
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.registerNib(SteakCollectionViewCell.self, forCellWithReuseIdentifier: "SteakCollectionImage")
        self.collectionView!.registerNib(UINib(nibName: "SteakCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SteakCollectionImage")
        
        let layout = self.collectionViewLayout as! UICollectionViewFlowLayout
        let width = (UIScreen.mainScreen().bounds.width - 2 * 5) / 4
        layout.itemSize = CGSize(width: width, height: width)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        let senderImage = sender as! String
        if segue.identifier == "detailImageSegue" {
//         let indexPaths = self.collectionView!.indexPathsForSelectedItems()!
//            let indexPath = indexPaths[0] as NSIndexPath
            let detailView = segue.destinationViewController as! ViewController
            detailView.images = senderImage
        }
    }
    

   override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("detailImageSegue", sender: steakImage[indexPath.row])
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return steakImage.count 
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SteakCollectionImage", forIndexPath: indexPath) as! SteakCollectionViewCell
    
        // Configure the cell
        cell.steakImageView?.image = UIImage(named: steakImage[indexPath.row])
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
