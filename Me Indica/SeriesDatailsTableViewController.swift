//
//  SeriesDatailsTableViewController.swift
//  Me Indica
//
//  Created by Samuel Pinheiro Junior on 10/01/16.
//  Copyright © 2016 Samuelpj. All rights reserved.
//

import UIKit
import Parse

class SeriesDatailsTableViewController: UIViewController {
    
    var seriesIndex = Int()
    var imageMain: UIImageView!
    var cachedImageViewSize: CGRect!
    var table = UITableView()
    let offset_HeaderStop:CGFloat = 40.0
    
    
    @IBOutlet weak var bannerImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setup()
    }
    
   

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueTwitter"{
            
            let seriesDetailsPassData = segue.destination as! TwitterViewController
            let objects = seriesData.object(at: seriesIndex) as! PFObject
            seriesDetailsPassData.hashtagTwitter = (objects.object(forKey: "hashtag") as? String)!
        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offset = scrollView.contentOffset.y
        var headerTransform = CATransform3DIdentity
        
        if let mainImage = imageMain {
            if offset < 0 {
                
                let headerScaleFactor:CGFloat = -(offset) / mainImage.bounds.height
                let headerSizevariation = ((mainImage.bounds.height * (1.0 + headerScaleFactor)) - mainImage.bounds.height)/2.0
                headerTransform = CATransform3DTranslate(headerTransform, 0, headerSizevariation, 0)
                headerTransform = CATransform3DScale(headerTransform, 1.0 + headerScaleFactor, 1.0 + headerScaleFactor, 0)
                
                mainImage.layer.transform = headerTransform
                print("B - \(mainImage.frame.height)")
            }  else {
                
                // Header -----------
                
                headerTransform = CATransform3DTranslate(headerTransform, 0, max(-offset_HeaderStop, -offset), 0)
                print("C - \(mainImage.frame.height)")
                //  ------------ Label
                
                //let labelTransform = CATransform3DMakeTranslation(0, max(-distance_W_LabelHeader, offset_B_LabelHeader - offset), 0)
                //headerLabel.layer.transform = labelTransform
                
                //  ------------ Blur
                
                //headerBlurImageView?.alpha = min (1.0, (offset - offset_B_LabelHeader)/distance_W_LabelHeader)
        
            }
        }
    }

    // MARK: - Private methods
    func setup(){
        let backButton = UIBarButtonItem(title: "Voltar", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.red
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
       
        
    }
    
   

}

extension SeriesDatailsTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let objects : PFObject = seriesData.object(at: seriesIndex) as! PFObject
        tableView.separatorColor = UIColor.white
        cell.titulo.text = objects.object(forKey: "title") as? String
        cell.lancamento.text = objects.object(forKey: "lancamento") as? String
        cell.status.text = objects.object(forKey: "status") as? String
        cell.txtSinopse.text = objects.object(forKey: "sinopseText") as? String
        
        if let mainImage = objects.object(forKey: "MainImage") as? PFFile {
            mainImage.getDataInBackground({ (imgData:Data?, error:Error?) -> Void in
                if error == nil{
                    guard let image = UIImage(data: imgData!) else {return}
                    self.bannerImage.image = image
                    self.imageMain = self.bannerImage
                    print("A - \(self.imageMain.frame.height)")
                }
            })
        }
        
        return cell
    }
}
