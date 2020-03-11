//
//  ViewController.swift
//  LeBonCoin
//
//  Created by Mattias on 09/03/2020.
//  Copyright © 2020 Mattias. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FilterViewControllerDelegate {
    
    private var myTableView: UITableView!
    var category: [Category] = []
    var titleItem = "Items"
    var allItems: [Item] = [] {
        didSet {
            self.filterItems()
        }
    }
    var selectedCategoryId: Int? {
        didSet {
            self.filterItems()
        }
    }
    
    var items: [Item] = []
    
    private func filterItems() {
        guard let selectedCategoryId = selectedCategoryId else {
            self.items = allItems
            return
        }
        
        self.items = allItems.filter({ (item) -> Bool in
            return item.category_id == selectedCategoryId
        })
        
        self.myTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getItem(string: APIHelper()._urlItem)
        getCategory(string: APIHelper()._urlCategory)
        
        myTableView = UITableView()
        
        self.view.addSubview(myTableView)
        view.backgroundColor = .orange
        
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        myTableView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        myTableView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        myTableView.register(ItemCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        setupNavigation()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if selectedCategoryId != nil {
            titleItem = category.filter({$0.id == items[0].category_id}).first!.name
        }
        setupNavigation()
    }
    
    
    
    
    
    func getItem(string: String) {
        APIHelper().getItem(string) { (listItem, errorString) in
            if errorString != nil {
                print(errorString!)
            }
            if listItem != nil {
                self.allItems = listItem!.sorted(by: { $0.is_urgent && !$1.is_urgent})
            }
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
            
        }
    }
    
    func getCategory(string: String) {
        APIHelper().getCategory(string) { (listCategory, errorString) in
            if errorString != nil {
                print(errorString!)
            }
            if listCategory != nil {
                self.category = listCategory!
            }
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
            
        }
    }
    
    func filterViewControllerIdButton(controller: FilterViewController, id: Int){
        selectedCategoryId = id
        navigationController?.popViewController(animated: true)
    }
    
    
    func setupNavigation() {
        navigationItem.title = titleItem
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filtres", style: .plain, target: self, action: #selector(filterByCategory(sender: )))
        
        self.navigationController?.navigationBar.barTintColor = .orange
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    @objc func filterByCategory(sender: UIBarButtonItem) {
        let filterVC = FilterViewController()
        filterVC.category = category
        filterVC.delegate = self
        self.navigationController?.pushViewController(filterVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.item = items[indexPath.row]
        detailVC.categories = category
        self.navigationController?.pushViewController(detailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as? ItemCell {
            
            cell.setupCell(item)
            return cell
        }
        return UITableViewCell()
    }
    
    
    
    
    //    override func viewDidLayoutSubviews() {
    //        super.viewDidLayoutSubviews()
    //    }
}

