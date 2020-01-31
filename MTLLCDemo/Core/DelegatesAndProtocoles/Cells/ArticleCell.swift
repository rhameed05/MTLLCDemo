//
//  ArticleCell.swift
//  MTLLCDemo
//
//  Created by Mac on 31/01/2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

public class ArticleCell: UITableViewCell {
    
    public static let nibName = "ArticleCell";
    public static let cellHeight:CGFloat = 130;
    
    
    @IBOutlet public weak var articleImageView: UIImageView!
    @IBOutlet public weak var dateAndTimeLabel: UILabel!
    @IBOutlet public weak var detailLabel: UILabel!
    @IBOutlet public weak var articleNameLabel: UILabel!
    @IBOutlet public weak var authorrNameLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.addDropShadow()
        cardView.layer.cornerRadius = 5.0
        articleImageView.layer.cornerRadius = 5.0;
        articleImageView.clipsToBounds = true;
    }
    func addDropShadow(radius:CGFloat = 6, opacity:Float = 0.3, borderWidth:CGFloat = 0.1) {
        cardView.layer.borderColor = UIColor.lightGray.cgColor
        cardView.layer.borderWidth = borderWidth;
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOpacity = opacity;
        cardView.layer.shadowOffset = CGSize.init(width: 1.0, height: 1.0)
        cardView.layer.shadowRadius = radius;
    }
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
