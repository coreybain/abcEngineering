//
//  ArticleTableViewCell.swift
//  ABCEngineering
//
//  Created by Arun Sinthanaisirrpi on 15/1/19.
//  Copyright © 2019 Australian Broadcasting Corporation. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var synopsis: UILabel!
    @IBOutlet weak var date: UILabel!
    
    //MARK: Variable
    var article:Article?
    
    public func setupArticle(article:Article) {
        self.article = article
        self.title.text = article.title
        self.synopsis.text = article.synopsis
        self.date.text = formateDate(date: article.publishedDate)
    }
    
    private func formateDate(date:Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.doesRelativeDateFormatting = true
        return formatter.string(from: date)
    }
}
