//
//  ViewController.swift
//  Compositional Layouts
//
//  Created by alexiuce on 2019/12/5.
//  Copyright © 2019 alexiuce. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var colorList: [UIColor] = {
        var tempList: [UIColor] = []
        
        for _ in 0...30 {
            let randomColor = UIColor.init(red:CGFloat(arc4random_uniform(255))/CGFloat(255.0), green:CGFloat(arc4random_uniform(255))/CGFloat(255.0), blue:CGFloat(arc4random_uniform(255))/CGFloat(255.0) , alpha: 1)
            tempList.append(randomColor)
        }
        return tempList
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.collectionViewLayout = generateColletionLayout()
    }
}

extension ViewController{
    
    fileprivate func generateColletionLayout()-> UICollectionViewLayout{
        /** item size */
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1/3))
        let fullItem = NSCollectionLayoutItem(layoutSize: itemSize)
        fullItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        /** second item */
        let secondSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(2/3), heightDimension: .fractionalHeight(1.0))
        let mainItem = NSCollectionLayoutItem(layoutSize: secondSize)
        mainItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        
        let pairSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5))
        let pairItem = NSCollectionLayoutItem(layoutSize: pairSize)
        pairItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        
        let pairGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1.0))
        let pairGroup = NSCollectionLayoutGroup.vertical(layoutSize: pairGroupSize, subitem: pairItem, count: 2)
        
        let secondGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(4/9))
        let secondGroup = NSCollectionLayoutGroup.horizontal(layoutSize: secondGroupSize, subitems: [mainItem,pairGroup])
        
        
        /** third item */
        let thirdItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1.0))
        let thirdItem = NSCollectionLayoutItem(layoutSize: thirdItemSize)
        thirdItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let thirdGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1/9))
        let thirdGroup = NSCollectionLayoutGroup.horizontal(layoutSize: thirdGroupSize, subitems: [thirdItem,thirdItem,thirdItem])
        
        
        /** group size */
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(8/9))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [fullItem,secondGroup,thirdGroup])
        
        /** section */
        let section = NSCollectionLayoutSection(group: group)
        
        /** layout */
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}


/** Data Source */
extension ViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return colorList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "test", for: indexPath)
        
        cell.backgroundColor = colorList[indexPath.row]
        return cell
    }
    
}



