//
//  PodcastDetailsTableViewController.swift
//  Me Indica
//
//  Created by Samuel Pinheiro Junior on 10/01/16.
//  Copyright © 2016 Samuelpj. All rights reserved.
//

import UIKit
import Parse

class PodcastDetailsTableViewController: UITableViewController {
    
    var podCastIndex = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let objects : PFObject = podcastData.object(at: podCastIndex) as! PFObject
        cell.tituloPodcast.text = objects.object(forKey: "title") as? String
        cell.txtOqueE.text = objects.object(forKey: "sinopseText") as? String
        
        if let mainImage = objects.object(forKey: "MainImage") as? PFFile{
            mainImage.getDataInBackground({ (imgData:Data?, error:Error?) -> Void in
                if error == nil{
                    guard let Image : UIImage = UIImage(data: imgData!) else {return}
                    cell.bannerImgPodcast.image = Image
                }
            })
        }
    
        return cell
    }
    
    func setup(){
        let backButton = UIBarButtonItem(title: "Voltar", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.red
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
    }
    
}
