//
//  ChatRoom.swift
//  RealTimeComunication
//
//  Created by alexiuce on 2019/11/28.
//  Copyright © 2019 alexiuce. All rights reserved.
//

import UIKit

class ChatRoom: NSObject {
    
    var username = ""
    let maxReadLength = 4096
    var inputStream: InputStream!
    var outputStream: OutputStream!
    
    
    
     /** 初始化网络通信 */
    func setupNetworkCommunication()  {
        var readStream: Unmanaged<CFReadStream>?
        var writeStream: Unmanaged<CFWriteStream>?

        CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault, "localhost" as CFString, 8989, &readStream, &writeStream)
        
        inputStream = readStream!.takeRetainedValue()
        outputStream = writeStream!.takeRetainedValue()
        
        inputStream.schedule(in: .current, forMode: .common)
        outputStream.schedule(in: .current, forMode: .common)
        
        inputStream.open()
        outputStream.open()
    }

    
    
    
}
