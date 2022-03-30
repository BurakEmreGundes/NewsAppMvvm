//
//  NewsListTableViewController.swift
//  NewsAppMvvm
//
//  Created by Burak Emre gündeş on 30.03.2022.
//

import Foundation
import UIKit


protocol IArticleListOutPut{
    func saveDatas(values: [ArticleViewModel])
}


class NewsListTableViewController: UITableViewController{
    
 
    
    private lazy var results : [ArticleViewModel] = []
    
    lazy var viewModel : IArticleListViewModel = ArticleListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        viewModel.setDelegate(output: self)
        viewModel.getAllArticles()
    }
    
    
    private func setup(){
        self.tableView.delegate=self
        self.tableView.dataSource=self
        self.navigationController?.navigationBar.prefersLargeTitles=true
    }
    
    
}

extension NewsListTableViewController{
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ArticleTableViewCell
        cell.titleLabel.text=results[indexPath.row].title
        cell.descriptionLabel.text=results[indexPath.row].description
        return cell
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return results.count
    }
}

extension NewsListTableViewController: IArticleListOutPut{
    func saveDatas(values: [ArticleViewModel]) {
     
            self.results = values
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
}
