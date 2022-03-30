//
//  ArticleViewModel.swift
//  NewsAppMvvm
//
//  Created by Burak Emre gündeş on 31.03.2022.
//

import Foundation
import Combine


protocol IArticleListViewModel{
    var articleList : [ArticleViewModel] {get set}
    var webService : IWebService {get set}
    func getAllArticles()
}




class ArticleListViewModel:ObservableObject,IArticleListViewModel{
    
    var articleList: [ArticleViewModel]=[]
    var webService: IWebService
    
    init(){
        self.webService = WebService()
    }
    
    func getAllArticles() {
        webService.fetchAllArticles { result in
            switch result {
            case .failure(let error):
                print(error)
                
            case .success(let articles):
                
                if let articles = articles {
                    DispatchQueue.main.async {
                        self.articleList = articles.map(ArticleViewModel.init)
                    }
              
                }
            }
        }
    }
    
    
}



struct ArticleViewModel{
   private let article: Article
}

extension ArticleViewModel{
    init(_ article: Article){
        self.article = article
    }
}



extension ArticleViewModel{
        
    var title : String {
        self.article.title
    }
    
    var description : String{
        self.article.description
    }
}


