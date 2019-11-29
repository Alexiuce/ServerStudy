//
//  ViewController.swift
//  RealTimeComunication
//
//  Created by alexiuce on 2019/11/28.
//  Copyright © 2019 alexiuce. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let chatRoom = ChatRoom()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatRoom.setupNetworkCommunication()
        
        
        
        
    }


}

