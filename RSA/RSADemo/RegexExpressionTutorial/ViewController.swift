//
//  ViewController.swift
//  RegexExpressionTutorial
//
//  Created by alexiuce on 2019/11/28.
//  Copyright © 2019 alexiuce. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let text = "Hello world is the first words in Computer programming"
        let mas = NSMutableAttributedString.init(string: text, attributes: [NSAttributedString.Key.foregroundColor:UIColor.black])
        
        mas.addAttributes([NSAttributedString.Key.font:UIFont.systemFont(ofSize: 12)], range: NSMakeRange(3, 3))
        
        testLabel.attributedText = mas
        
        
        
        
        
        
    }


}

