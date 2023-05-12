//
//  FilmesDetailsTableViewController.swift
//  Me Indica
//
//  Created by Samuel Pinheiro Junior on 11/01/16.
//  Copyright © 2016 Samuelpj. All rights reserved.
//

import UIKit

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
        
        
        cell.tituloFilmes.text = "Title"
        cell.txtSinopseFilmes.text = "sinopseText"
        cell.bannerImageFilmes.image = UIImage(systemName: "photo.artframe")
           
        return cell
    }
    
    func setup(){
        let backButton = UIBarButtonItem(title: "Voltar", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.red
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
    }
    
    
}
