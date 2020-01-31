//
//  TableViewDelegate.swift
//  MTLLCDemo
//
//  Created by Mac on 31/01/2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class TableViewDelegate: NSObject, UITableViewDelegate {
    
    weak var delegate: ViewControllerDelegate?
    

    init(withDelegate delegate: ViewControllerDelegate) {
        self.delegate = delegate
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.selectedCell(row: indexPath.row)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
