//
//  Article.swift
//  NewsAppMvvm
//
//  Created by Burak Emre gündeş on 30.03.2022.
//

import Foundation


struct ResultModel: Decodable{
    let articles : [Article]
    
}


struct Article: Decodable{
    let title: String
    let description: String
}


