//
//  SeriesDatailsTableViewController.swift
//  Me Indica
//
//  Created by Samuel Pinheiro Junior on 10/01/16.
//  Copyright © 2016 Samuelpj. All rights reserved.
//

import UIKit
import Parse

class SeriesDatailsTableViewController: UITableViewController {
    
    var seriesIndex = Int()
    
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
        
        let objects : PFObject = seriesData.object(at: seriesIndex) as! PFObject
        
        
        cell.titulo.text = objects.object(forKey: "title") as? String
        cell.lancamento.text = objects.object(forKey: "lancamento") as? String
        cell.status.text = objects.object(forKey: "status") as? String
        cell.txtSinopse.text = objects.object(forKey: "sinopseText") as? String
        
        if let mainImage = objects.object(forKey: "MainImage") as? PFFile {
            mainImage.getDataInBackground({ (imgData:Data?, error:Error?) -> Void in
                if error == nil{
                    guard let Image = UIImage(data: imgData!) else {return}
                    cell.bannerImg.image = Image
                }
            })
        }
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueTwitter"{
            
            let seriesDetailsPassData = segue.destination as! TwitterViewController
            let objects = seriesData.object(at: seriesIndex) as! PFObject
            seriesDetailsPassData.hashtagTwitter = (objects.object(forKey: "hashtag") as? String)!
        }
        
    }

    // MARK: - Private methods
    func setup(){
        tableView.estimatedRowHeight = 100
        tableView.separatorColor = UIColor.white
        tableView.rowHeight = UITableViewAutomaticDimension
        let backButton = UIBarButtonItem(title: "Voltar", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = UIColor.red
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
    }
    

   
}
