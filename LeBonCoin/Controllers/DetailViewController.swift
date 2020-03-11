//
//  DetailViewController.swift
//  LeBonCoin
//
//  Created by Mattias on 10/03/2020.
//  Copyright © 2020 Mattias. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var myView: UIView!
    var item: Item!
    var categories: [Category]!
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
//        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    let itemDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
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
    let itemCategory: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let itemDate: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        myView = UIView()
        self.view.addSubview(myView)
        myView.addSubview(itemDate)
        myView.addSubview(itemCategory)
        myView.addSubview(itemImage)
        myView.addSubview(itemPrice)
        myView.addSubview(itemTitle)
        myView.addSubview(itemDescription)
        myView.addSubview(isUrgent)
        myView.backgroundColor = .white
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        myView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        myView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        myView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        itemImage.topAnchor.constraint(equalTo: self.myView.topAnchor, constant: 10).isActive = true
        itemImage.leadingAnchor.constraint(equalTo: self.myView.leadingAnchor, constant: 5).isActive = true
        itemImage.trailingAnchor.constraint(equalTo: self.myView.trailingAnchor, constant: -5).isActive = true
        itemImage.heightAnchor.constraint(equalToConstant: 250).isActive = true
        itemTitle.topAnchor.constraint(equalTo: self.itemImage.bottomAnchor, constant: 20).isActive = true
        itemTitle.leadingAnchor.constraint(equalTo: self.myView.leadingAnchor, constant: 10).isActive = true
        itemTitle.trailingAnchor.constraint(equalTo: self.myView.trailingAnchor, constant: -10).isActive = true
        itemPrice.topAnchor.constraint(equalTo: self.itemTitle.bottomAnchor, constant: 20).isActive = true
        itemPrice.leadingAnchor.constraint(equalTo: self.myView.leadingAnchor, constant: 10).isActive = true
        itemCategory.topAnchor.constraint(equalTo: self.itemPrice.bottomAnchor, constant: 20).isActive = true
        itemCategory.leadingAnchor.constraint(equalTo: self.myView.leadingAnchor, constant: 10).isActive = true
        itemDate.topAnchor.constraint(equalTo: self.itemCategory.bottomAnchor, constant: 20).isActive = true
        itemDate.leadingAnchor.constraint(equalTo: self.myView.leadingAnchor, constant: 10).isActive = true
        itemDescription.topAnchor.constraint(equalTo: self.itemDate.bottomAnchor, constant: 20).isActive = true
        itemDescription.leadingAnchor.constraint(equalTo: self.myView.leadingAnchor, constant: 10).isActive = true
        itemDescription.trailingAnchor.constraint(equalTo: self.myView.trailingAnchor, constant: -10).isActive = true
        isUrgent.bottomAnchor.constraint(equalTo: self.itemImage.bottomAnchor, constant: -20).isActive = true
        isUrgent.leadingAnchor.constraint(equalTo: self.myView.leadingAnchor, constant: 15).isActive = true
        
        
        setupCell(item)
        print(itemTitle)
        
    }
    
    func setupCell(_ item: Item) {
        if item.images_url.thumb != nil {
            self.itemImage.download(item.images_url.thumb!)
        }
        self.itemTitle.text =  item.title
        self.itemPrice.text = "Prix : " + String(Int(item.price)) + "€"
        self.itemDescription.text = "Description : " + item.description
        self.itemDate.text = stringToDate(dateString: item.creation_date)
        self.itemCategory.text = "Catégorie : " + categories.filter({$0.id == item.category_id}).first!.name
        if item.is_urgent {
            self.isUrgent.text = "Urgent"
        } else {
            self.isUrgent.text = ""
        }
    }
    func stringToDate(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: dateString)
        dateFormatter.dateFormat = "à hh:mm, 'le' dd/MM/yy"
        let timeStr = dateFormatter.string(from: date!)
        return timeStr
    }
}
