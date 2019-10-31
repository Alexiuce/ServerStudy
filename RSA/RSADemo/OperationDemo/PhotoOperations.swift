//
//  PhotoOperations.swift
//  OperationDemo
//
//  Created by alexiuce on 2019/10/28.
//  Copyright © 2019 alexiuce. All rights reserved.
//

import Foundation
import UIKit


enum PhoteRecordsState: Int {
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
class PendingOperations{
    lazy var downloadInProgress: [IndexPath : Operation] = [:]
    lazy var downloadQueue : OperationQueue = {
        var queue = OperationQueue()
        queue.name = "Download queue"
        queue.maxConcurrentOperationCount = 1
        return queue
    }()
    
    lazy var filtrationInProgress : [IndexPath : Operation] = [:]
    lazy var filtrationQueue: OperationQueue = {
        var queue = OperationQueue()
        queue.name = "Image filtration queue"
        queue.maxConcurrentOperationCount = 1
        return queue
    }()
}

class ImageDownloader: Operation{
    let photoRecord: PhotoRecord
    
    init(_ photoRecord: PhotoRecord) {
        self.photoRecord = photoRecord
    }
    
    override func main() {
        if isCancelled {return}
        guard let imageData = try? Data(contentsOf: photoRecord.url) else { return }
        if isCancelled {return}
        if imageData.isEmpty {
            photoRecord.state = .failed
            photoRecord.image = UIImage(named: "placeholder")
        }else{
            photoRecord.state = .download
            photoRecord.image = UIImage(data: imageData)
        }
    }
}

class ImageFiltration: Operation {
    let photeRecord : PhotoRecord
    init(_ photeRecord: PhotoRecord) {
        self.photeRecord = photeRecord
    }
    
    override func main() {
        if isCancelled {return}
        guard self.photeRecord.state == .download else { return }
        
        if let image = self.photeRecord.image,
           let filterImage = applyFilterImage(image){
            photeRecord.image = filterImage
            photeRecord.state = .filted
        }
    }
    
    /** 图片过滤处理 */
    func applyFilterImage(_ image: UIImage) -> UIImage? {
        return nil
    }
}
