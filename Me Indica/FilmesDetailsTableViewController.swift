//
//  FilmesDetailsTableViewController.swift
//  Me Indica
//
//  Created by Samuel Pinheiro Junior on 11/01/16.
//  Copyright © 2016 Samuelpj. All rights reserved.
//

import UIKit
import Parse

class FilmesDetailsTableViewController: UITableViewController {
    
    var filmesIndex = Int()
    
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
        
        let objects = filmesData.object(at: filmesIndex) as! PFObject
        cell.tituloFilmes.text = objects.object(forKey: "title") as? String
        cell.txtSinopseFilmes.text = objects.object(forKey: "sinopseText") as? String
        
        if let mainImage = objects.object(forKey: "MainImage") as? PFFile {
            mainImage.getDataInBackground({ (imgData:Data?, error:Error?) -> Void in
                if error == nil{
                    guard let Image = UIImage(data: imgData!) else {return}
                    cell.bannerImageFilmes.image = Image
                }
            })
        }
        return cell
    }
    
    func setup(){
        tableView.estimatedRowHeight = 100
        tableView.separatorColor = UIColor.white
        tableView.rowHeight = UITableViewAutomaticDimension
        let backButton = UIBarButtonItem(title: "Voltar", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = UIColor.red
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
    }
    
    
}
