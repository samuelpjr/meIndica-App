//
//  SeriesCollectionViewController.swift
//  MeIndicaTeste
//
//  Created by Samuel Pinheiro Junior on 20/07/16.
//  Copyright © 2016 Samuelpj. All rights reserved.
//

import UIKit
import Parse



class SeriesCollectionViewController: UICollectionViewController {
    
    //MARK: - Properties
    var seriesIndex = Int()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    
    //MARK: - Outlets
    @IBOutlet var collection: UICollectionView!
    
    //MARK: - Private Properties
    fileprivate let sectionInsets = UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 0.0)
    fileprivate let itemsPerRow: CGFloat = 3
    
    
    // MARK: - Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        showActivitIndicator()
        loadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return seriesData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cellId = "CollectionViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CollectionViewCell
        let objects = seriesData.object(at: (indexPath as NSIndexPath).row) as! PFObject
        if let thumbCellImage = objects.object(forKey: "thumbImgCell") as? PFFile {
            thumbCellImage.getDataInBackground({ (imgData:Data?, error:Error?) -> Void in
                if error == nil{
                    guard let Image = UIImage(data: imgData!) else {return}
                    cell.thumbImgSeries.image = Image
                }
            })
        }
        
        activityIndicator.stopAnimating()
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seriesDetalhes"{
            if (sender as? UICollectionViewCell) != nil{
                if let indexPaths = self.collectionView?.indexPathsForSelectedItems , indexPaths.count > 0{
                    let indexPath = (self.collectionView?.indexPathsForSelectedItems?[0])! as NSIndexPath
                    let seriesPassData : SeriesDatailsTableViewController = segue.destination as! SeriesDatailsTableViewController
                    seriesPassData.seriesIndex = indexPath.row
                }
            }
        }
    }
    
    private func showActivitIndicator(){
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }

    //MARK: - Load
    func loadData(){
        seriesData.removeAllObjects()
        
        let findSeriesData = PFQuery(className: "Series")
        findSeriesData.cachePolicy = .cacheElseNetwork
        findSeriesData.cachePolicy = .networkElseCache
        
        findSeriesData.findObjectsInBackground { (objects, error) in
            if error == nil{
                if objects != nil {
                    for object in objects!{
                        let series : PFObject = object
                        seriesData.add(series)
                    }
                } else {
                    print(error ?? "Erro series parse")
                }
                
                let myarray : NSArray = seriesData.reverseObjectEnumerator().allObjects as NSArray
                seriesData = NSMutableArray(array : myarray)
                self.collectionView?.reloadData()
            } else {
             print(error ?? "Erro series parse")
            }
        }
        
    }
}


extension SeriesCollectionViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        let heightPerItem = widthPerItem + 35
        
        return CGSize(width: widthPerItem, height: heightPerItem)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
}



