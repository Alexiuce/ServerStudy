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
        let attribDict: [NSAttributedString.Key : Any] = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 38),
                                                          NSAttributedString.Key.textEffect : NSAttributedString.TextEffectStyle.letterpressStyle]
        mas.addAttributes(attribDict, range: NSMakeRange(0, 5))
        testLabel.attributedText = mas
        
        
        /** 排斥路径 */
        
        
        
        
    }


}

