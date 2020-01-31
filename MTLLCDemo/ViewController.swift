//
//  ViewController.swift
//  MTLLCDemo
//
//  Created by Mac on 29/01/2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import MBProgressHUD
class ViewController: UIViewController, ViewControllerDelegate {
    var tableViewDatasource: TableViewDataSource?
    var tableViewDelegate: TableViewDelegate?
 @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Top Articles"
        MBProgressHUD.showAdded(to: self.view, animated: true)
        ApiManager.shareInstance.getAllTopArticlesData(completion: {
            (articles,error) in
            
            if error == nil {
                self.tableViewDelegate = TableViewDelegate(withDelegate: self)
                self.tableViewDatasource = TableViewDataSource(withData: articles!.results!)
                DispatchQueue.main.async {
                    MBProgressHUD.hide(for: self.view, animated: true)
                    self.tableView.register(UINib(nibName: "ArticleCell", bundle: nil), forCellReuseIdentifier: "ArticleCell")
                    self.tableView.delegate = self.tableViewDelegate
                    self.tableView.dataSource = self.tableViewDatasource
                     self.tableView.reloadData()
                }
               
            }
        })
    }

    func selectedCell(row: Int) {
           print("Row: \(row)")
        let vc = ArticleDetailsVC()
        vc.articleUrl =  (self.tableViewDatasource?.data[row].url)!
        vc.title = self.tableViewDatasource?.data[row].title
        self.navigationController?.pushViewController(vc, animated: true)
       
    }
}

