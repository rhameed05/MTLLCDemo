//
//  TableViewDataSource.swift
//  MTLLCDemo
//
//  Created by Mac on 31/01/2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import SDWebImage
class TableViewDataSource: NSObject, UITableViewDataSource {
    var data = Array<Results>()
    //self.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")

    init(withData data: Array<Results>) {
        self.data = data
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell

        cell.articleNameLabel.text = self.data[indexPath.row].title
        cell.detailLabel?.text = self.data[indexPath.row].abstract
        cell.articleImageView?.sd_setImage(with: URL(string: (self.data[indexPath.row].media?.first?.mediadata?.first!.url)!), placeholderImage: UIImage(named: "placeholder.png"))
        cell.dateAndTimeLabel.text = self.data[indexPath.row].published_date
        cell.authorrNameLabel?.text = self.data[indexPath.row].byline
        return cell
    }
    
    
}

