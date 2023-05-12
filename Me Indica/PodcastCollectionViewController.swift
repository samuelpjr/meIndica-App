//
//  PodcastCollectionViewController.swift
//  Me Indica
//
//  Created by Samuel Pinheiro Junior on 10/01/16.
//  Copyright © 2016 Samuelpj. All rights reserved.
//

import UIKit

class PodcastCollectionViewController: UICollectionViewController, UIGestureRecognizerDelegate {
    
    //MARK: - Properties
    var podcastsIndex = Int()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    //MARK: - Outlets
    @IBOutlet var collection: UICollectionView!
    
    // MARK: private properties
    fileprivate let sectionInsets = UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 0.0)
    fileprivate let itemsPerRow: CGFloat = 3

    // MARK: - Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        showActivitIndicator()
//        loadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "podcastsDetalhes"{
            if (sender as? UICollectionViewCell) != nil{
                if let indexPaths = self.collectionView?.indexPathsForSelectedItems , indexPaths.count > 0{
                    let indexPath = (self.collectionView?.indexPathsForSelectedItems?[0])! as NSIndexPath
                    let podcastsPassData  = segue.destination as! PodcastDetailsTableViewController
                    podcastsPassData.podCastIndex = indexPath.row
                }
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 12
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cellId = "CollectionViewCellPod"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CollectionViewCell
        cell.thumbImgPodcast.image = UIImage(systemName: "photo.stack.fill")
        
        activityIndicator.stopAnimating()
        return cell
    }
    
    // MARK: - Private Function
    private func showActivitIndicator(){
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.medium
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
    }
    
    //MARK: - Load
//    private func loadData(){
//        podcastData.removeAllObjects()
//        
//        let findPodcatsData = PFQuery(className: "Podcasts")
//        findPodcatsData.cachePolicy = .cacheElseNetwork
//        findPodcatsData.cachePolicy = .networkElseCache
//        
//        findPodcatsData.findObjectsInBackground { (objects, error) in
//            if error == nil{
//                if objects != nil {
//                    for object in objects!{
//                        let podcast : PFObject = object
//                        podcastData.add(podcast)
//                    }
//                } else {
//                    print(error ?? "Erro podcast parse")
//                }
//                
//                let myarray : NSArray = podcastData.reverseObjectEnumerator().allObjects as NSArray
//                podcastData = NSMutableArray(array : myarray)
//                self.collectionView?.reloadData()
//            } else {
//                print(error ?? "Erro podcast parse")
//            }
//        }
//        
//    }
}

extension PodcastCollectionViewController : UICollectionViewDelegateFlowLayout {
    
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
