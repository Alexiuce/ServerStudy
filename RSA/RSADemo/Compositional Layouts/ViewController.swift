//
//  ViewController.swift
//  Compositional Layouts
//
//  Created by alexiuce on 2019/12/5.
//  Copyright © 2019 alexiuce. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
}

extension ViewController{
    
    fileprivate func generateColletionLayout()-> UICollectionViewLayout{
        /** item size */
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let fullItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        /** group size */
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(2/3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: fullItem, count: 1)
        
        /** section */
        let section = NSCollectionLayoutSection(group: group)
        
        /** layout */
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    
}

