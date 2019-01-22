//
//  ArticleListTableViewController.swift
//  ABCEngineering
//
//  Created by Arun Sinthanaisirrpi on 15/1/19.
//  Copyright © 2019 Australian Broadcasting Corporation. All rights reserved.
//

import UIKit
import ABCWebView

class ArticleListTableViewController: UITableViewController {
    
    var loader = ArticleLoader()
    var articles = [Article]()
    var error: Error?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = "articleTableView"
        
        //Load nib and identifier
        let nib = UINib(nibName: "ArticleTableViewCell", bundle: Bundle.main)
        self.tableView.register(nib, forCellReuseIdentifier:"reuseIdentifierA" )
        
        //Init refresh controller
        initRefreshControls()
        
        //Set logo for title
        navigationController?.navigationBar.barTintColor = .black
        let imageView = UIImageView(frame: CGRect(x:0, y:0, width:10.0, height:10.0))
        imageView.image = #imageLiteral(resourceName: "abcLogo")
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
        
        //Load articles
        load()
    }
    
    func load() {
        self.tableView.refreshControl?.beginRefreshing()
        loader.load { articles, error in
            if let uArticles = articles {
                self.articles = uArticles
                self.refreshControl?.endRefreshing()
                self.tableView.reloadData()
            } else {
                // error not handled in this exercise
                fatalError()
            }
        }
    }
    
    func initRefreshControls() {
//        check that there is an existing refresh controller
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refreshControlValueChanged), for: .valueChanged)
    }
    
    @objc func refreshControlValueChanged() {
        guard let refreshControl = refreshControl, refreshControl.isRefreshing else { return }
        load()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifierA", for: indexPath) as? ArticleTableViewCell else {
            fatalError()
        }
        
        cell.setupArticle(article: articles[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        if let url = URL(string: article.href) {
            let controller = WebViewController(url: url)
            controller.setNavTextColor(color: .white)
            controller.setNavColor(color: .black)
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }

}
