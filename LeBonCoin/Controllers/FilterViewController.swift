//
//  FilterViewController.swift
//  LeBonCoin
//
//  Created by Mattias on 10/03/2020.
//  Copyright © 2020 Mattias. All rights reserved.
//

import UIKit

protocol FilterViewControllerDelegate: class {
    func filterViewControllerIdButton(controller: FilterViewController, id: Int)
}

class FilterViewController: UIViewController {
    
    var category: [Category] = []
    var allButtons = [UIButton]()
    weak var delegate: FilterViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        var y = 150
        for each in category {
            let button = UIButton(frame: CGRect(x: 100, y: y, width: 200, height: 50))
            button.addTarget(self, action: #selector(self.buttonDidTap(_:)), for: .touchUpInside)
            button.tag = each.id
            button.setTitle(each.name, for: .normal)
            button.backgroundColor = .orange
            button.layer.cornerRadius = 20
            allButtons.append(button)
            view.addSubview(button)
            y = y + 60
        }
        
        
    
    }
    
    
    @objc private func buttonDidTap(_ sender: UIButton) {
        let categoryId = sender.tag
        print(categoryId)
        delegate?.filterViewControllerIdButton(controller: self, id: categoryId)
    }
    
    
    
}
