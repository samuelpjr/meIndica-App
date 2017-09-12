//
//  TwitterViewController.swift
//  Me Indica
//
//  Created by Samuel Pinheiro Junior on 11/01/16.
//  Copyright © 2016 Samuelpj. All rights reserved.
//

import UIKit
import TwitterKit

class TwitterViewController: TWTRTimelineViewController {
    
    var hashtagTwitter = String()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTwitter()
        setup()
    }
    

    func loadTwitter(){
        if Reachability.isConnectedToNetwork() == true{
            let client = TWTRAPIClient()
            dataSource = TWTRSearchTimelineDataSource(searchQuery: hashtagTwitter, apiClient: client)
        }else{
            let alert = UIAlertController(title: "Ooops...", message: "Por favor verifique sua conexao", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default){_ in})
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        stopActivitIndicator()
    }
    
    func setup(){
        let backButton = UIBarButtonItem(title: "Voltar", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = UIColor.red
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    private func showActivitIndicator(){
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
    }
    
    func stopActivitIndicator(){
        DispatchQueue.main.async(execute: {
            self.loadTwitter()
            self.activityIndicator.stopAnimating()
            return
        })
        
    }
}







