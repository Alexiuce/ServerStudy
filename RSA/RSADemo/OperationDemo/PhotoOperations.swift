//
//  PhotoOperations.swift
//  OperationDemo
//
//  Created by alexiuce on 2019/10/28.
//  Copyright © 2019 alexiuce. All rights reserved.
//

import Foundation
import UIKit


enum PhoteRecordsState {
    case new,download,filted,failed
}

class PhotoRecord{
    let name: String
    let url: URL
    var state = PhoteRecordsState.new
    var image = UIImage(named: "placeholder")
    
    init(name: String, url:URL) {
        self.name = name
        self.url = url
    }
}
