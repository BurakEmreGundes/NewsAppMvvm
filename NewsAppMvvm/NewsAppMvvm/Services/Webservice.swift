//
//  Webservice.swift
//  NewsAppMvvm
//
//  Created by Burak Emre gündeş on 30.03.2022.
//

import Foundation


enum WebServiceEndPoint: String{
    case BASE_URL = "https://newsapi.org/v2/everything"
    case API_KEY = "5c3aa393bd994bd3ab5d2d983f5f30eb"
    case PATH = "?q=apple&from=2022-03-29&to=2022-03-29&sortBy=popularity&apiKey="

    static func articlesPath() -> URL{
        return URL(string: "\(BASE_URL.rawValue)\(PATH.rawValue)\(API_KEY.rawValue)")!
    }
}


protocol IWebService{
    func fetchAllArticles(completion: @escaping(Result<[Article]?,DownloandError>)->())
}


struct WebService: IWebService{
    func fetchAllArticles(completion: @escaping (Result<[Article]?,DownloandError>) -> ()) {
        URLSession.shared.dataTask(with: WebServiceEndPoint.articlesPath()) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.badUrl))
            }else{
                guard let data = data , error == nil else{
                    return completion(.failure(.noData))
                }
                
                if let results = try? JSONDecoder().decode(ResultModel.self, from: data){
             
                    completion(.success(results.articles))
                }else{
                    completion(.failure(.dataParserError))
                }
                
              
                
               
            }
        
        }.resume()
    }
}


enum DownloandError : Error{
    case badUrl
    case noData
    case dataParserError
}
