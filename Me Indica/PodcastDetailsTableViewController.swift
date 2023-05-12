//
//  PodcastDetailsTableViewController.swift
//  Me Indica
//
//  Created by Samuel Pinheiro Junior on 10/01/16.
//  Copyright © 2016 Samuelpj. All rights reserved.
//

import UIKit

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
        
        cell.tituloPodcast.text = "Title"
        cell.txtOqueE.text = "sinopseText"
        cell.bannerImgPodcast.image = UIImage(systemName: "photo.artframe")
    
        return cell
    }
    
    func setup(){
        let backButton = UIBarButtonItem(title: "Voltar", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.red
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
    }
    
}
