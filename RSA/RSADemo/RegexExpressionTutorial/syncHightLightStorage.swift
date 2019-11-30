//
//  syncHightLightStorage.swift
//  RegexExpressionTutorial
//
//  Created by alexiuce on 2019/11/30.
//  Copyright © 2019 alexiuce. All rights reserved.
//

import UIKit

class syncHightLightStorage: NSTextStorage {

    let backStore = NSMutableAttributedString()
    
    override var string: String{
        return backStore.string
    }
    override func attributes(at location: Int, effectiveRange range: NSRangePointer?) -> [NSAttributedString.Key : Any] {
        return backStore.attributes(at: location, effectiveRange: range)
    }
    
    
}
