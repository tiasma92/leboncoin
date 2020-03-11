//
//  ItemCell.swift
//  LeBonCoin
//
//  Created by Mattias on 09/03/2020.
//  Copyright © 2020 Mattias. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    var item: Item!
    
    let itemImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        
        return img
    }()
    let itemTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    let itemCategory: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    let itemPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let isUrgent: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
//    let containerView:UIView = {
//      let view = UIView()
//      view.translatesAutoresizingMaskIntoConstraints = false
//      view.clipsToBounds = true
//      return view
//    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(itemTitle)
        contentView.addSubview(itemPrice)
        contentView.addSubview(itemImage)
        contentView.addSubview(isUrgent)
        contentView.addSubview(itemCategory)
        itemImage.topAnchor.constraint(equalTo:self.contentView.topAnchor, constant: 0).isActive = true
        itemImage.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant: 0).isActive = true
        itemImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
        itemImage.trailingAnchor.constraint(equalTo: self.itemTitle.leadingAnchor, constant: -20).isActive = true
        itemImage.widthAnchor.constraint(equalToConstant:100).isActive = true
        itemTitle.topAnchor.constraint(equalTo:self.contentView.topAnchor, constant: 10).isActive = true
        itemTitle.leadingAnchor.constraint(equalTo:self.itemImage.trailingAnchor,constant: 20).isActive = true
//        itemTitle.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant: 0).isActive = true
        itemPrice.bottomAnchor.constraint(equalTo:self.contentView.bottomAnchor, constant: -10).isActive = true
        itemPrice.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        itemCategory.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        itemCategory.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 10).isActive = true
        itemCategory.leadingAnchor.constraint(equalTo: self.itemTitle.trailingAnchor, constant: 10).isActive = true
        isUrgent.leadingAnchor.constraint(equalTo: self.itemImage.trailingAnchor, constant: 20).isActive = true
        isUrgent.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
        isUrgent.topAnchor.constraint(greaterThanOrEqualTo: self.itemTitle.bottomAnchor, constant: 10).isActive = true
//
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupCell(_ item: Item) {
        if item.images_url.small != nil {
            self.itemImage.download(item.images_url.small!)
        }
        self.itemTitle.text = item.title
        self.itemPrice.text = String(Int(item.price)) + " €"
//        self.itemCategory.text = item.category_id
        if item.is_urgent {
            self.isUrgent.text = "Urgent"
        } else {
        self.isUrgent.text = ""
        }
    }
    
    
    
}
