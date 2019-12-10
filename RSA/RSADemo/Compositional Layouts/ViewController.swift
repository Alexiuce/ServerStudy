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
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1.0))
        let fullItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        /** group size */
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1/3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: fullItem, count: 2)
        
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



