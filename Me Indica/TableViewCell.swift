//
//  TableViewCell.swift
//  Me Indica
//
//  Created by Samuel Pinheiro Junior on 10/01/16.
//  Copyright © 2016 Samuelpj. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    //MARK: - Series
    //@IBOutlet var bannerImg: UIImageView!
    @IBOutlet var lancamento: UILabel!
    @IBOutlet var status: UILabel!
    @IBOutlet var titulo: UILabel!
    @IBOutlet var txtSinopse: UILabel!
    
    //MARK: - Podcast
    @IBOutlet var bannerImgPodcast: UIImageView!
    @IBOutlet var tituloPodcast: UILabel!
    @IBOutlet var txtOqueE: UILabel!
    
    //MARK: - Filmes
    @IBOutlet var bannerImageFilmes: UIImageView!
    @IBOutlet var tituloFilmes: UILabel!
    @IBOutlet var txtSinopseFilmes: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
