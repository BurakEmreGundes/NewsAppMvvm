//
//  ArticleViewModel.swift
//  NewsAppMvvm
//
//  Created by Burak Emre gündeş on 31.03.2022.
//

import Foundation



protocol IArticleListViewModel{
    var articleList : [ArticleViewModel] {get set}
    var webService : IWebService {get set}
    func getAllArticles()
    var articleListOutPut : IArticleListOutPut? {get set}
    func setDelegate(output: IArticleListOutPut)
}




final class ArticleListViewModel:IArticleListViewModel{
    var articleListOutPut: IArticleListOutPut?
    
  
    
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
                        self.articleList = articles.map(ArticleViewModel.init)
                    print(self.articleList)
                        self.articleListOutPut?.saveDatas(values: self.articleList)
                }
            }
        }
    }
    func setDelegate(output: IArticleListOutPut) {
        self.articleListOutPut = output
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


