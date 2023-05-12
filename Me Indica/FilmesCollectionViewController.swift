//
//  FilmesCollectionViewController.swift
//  Me Indica
//
//  Created by Samuel Pinheiro Junior on 11/01/16.
//  Copyright © 2016 Samuelpj. All rights reserved.
//

import UIKit


class FilmesCollectionViewController: UICollectionViewController {
    
    //MARK: - Properties
    var filmesIndex = Int()
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
//        loadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 12
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cellId = "CollectionViewCellFilme"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CollectionViewCell
        cell.thumbImgFilme.image = UIImage(systemName: "photo.stack.fill")
        
        activityIndicator.stopAnimating()
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "filmesDetalhes"{
            if (sender as? UICollectionViewCell) != nil{
                if let indexPaths = self.collectionView?.indexPathsForSelectedItems, indexPaths.count > 0{
                    let indexPath = (self.collectionView?.indexPathsForSelectedItems?[0])! as NSIndexPath
                    let filmesPassData = segue.destination as! FilmesDetailsTableViewController
                    filmesPassData.filmesIndex = indexPath.row
                }
            }
        }
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
//    func loadData(){
//        filmesData.removeAllObjects()
//
//        let findfilmesData = PFQuery(className: "Filmes")
//        findfilmesData.cachePolicy = .cacheElseNetwork
//        findfilmesData.cachePolicy = .networkElseCache
//
//        findfilmesData.findObjectsInBackground { (objects, error) in
//            if error == nil{
//                if objects != nil {
//                    for object in objects!{
//                        let filmes : PFObject = object
//                        filmesData.add(filmes)
//                    }
//                } else {
//                    print(error ?? "Erro filme parse")
//                }
//
//                let myarray : NSArray = filmesData.reverseObjectEnumerator().allObjects as NSArray
//                filmesData = NSMutableArray(array : myarray)
//                self.collectionView?.reloadData()
//            } else {
//                print(error ?? "Erro filme parse")
//            }
//        }
//
//    }
}

extension FilmesCollectionViewController : UICollectionViewDelegateFlowLayout {
    
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



