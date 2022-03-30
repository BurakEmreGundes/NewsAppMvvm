//
//  NewsListTableViewController.swift
//  NewsAppMvvm
//
//  Created by Burak Emre gündeş on 30.03.2022.
//

import Foundation
import UIKit


class NewsListTableViewController: UITableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles=true
    }
    
    
}
