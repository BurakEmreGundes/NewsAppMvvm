//
//  ArticleTableViewCell.swift
//  NewsAppMvvm
//
//  Created by Burak Emre gündeş on 31.03.2022.
//

import Foundation
import UIKit

class ArticleTableViewCell : UITableViewCell{
    
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
