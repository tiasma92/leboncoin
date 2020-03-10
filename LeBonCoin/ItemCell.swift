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
        label.numberOfLines = 0
        return label
    }()
//    let itemDescription: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 14)
//        label.textColor = .black
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.numberOfLines = 0
//        return label
//    }()
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
        itemImage.topAnchor.constraint(equalTo:self.contentView.topAnchor, constant: 0).isActive = true
        itemImage.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant: 0).isActive = true
        itemImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
        itemImage.trailingAnchor.constraint(equalTo: self.itemTitle.leadingAnchor, constant: -20).isActive = true
        itemImage.widthAnchor.constraint(equalToConstant:100).isActive = true
//        itemImage.heightAnchor.constraint(equalToConstant:70).isActive = true
        
        itemTitle.topAnchor.constraint(equalTo:self.contentView.topAnchor, constant: 10).isActive = true
        itemTitle.leadingAnchor.constraint(equalTo:self.itemImage.trailingAnchor,constant: 20).isActive = true
        itemTitle.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant: 0).isActive = true
//        itemTitle.bottomAnchor.constraint(equalTo: self.itemPrice.topAnchor, constant: 10).isActive = true
//        itemPrice.topAnchor.constraint(equalTo:self.itemTitle.bottomAnchor, constant: 20).isActive = true
//        itemPrice.leadingAnchor.constraint(equalTo:self.itemImage.trailingAnchor, constant: 20).isActive = true
        itemPrice.bottomAnchor.constraint(equalTo:self.contentView.bottomAnchor, constant: -10).isActive = true
        itemPrice.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        isUrgent.leadingAnchor.constraint(equalTo: self.itemImage.trailingAnchor, constant: 20).isActive = true
        isUrgent.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
//        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
//        containerView.leadingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:10).isActive = true
//        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
//        containerView.heightAnchor.constraint(equalToConstant:40).isActive = true
        
        
//        self.contentView.addSubview(containerView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupCell(_ item: Item) {
        self.itemImage.download(item.images_url.small!)
        self.itemTitle.text = item.title
        self.itemPrice.text = String(item.price) + "€"
        if item.is_urgent {
            self.isUrgent.text = "Urgent"
        } else {
        self.isUrgent.text = ""
        }
    }
    
    
    
}
