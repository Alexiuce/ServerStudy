//
//  ViewController.swift
//  CoreImageDemo
//
//  Created by alexiuce on 2019/11/1.
//  Copyright © 2019 alexiuce. All rights reserved.
//

import UIKit
import AssetsLibrary
import Photos



class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imgSlider: UISlider!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var randomImgView: UIImageView!
    
    var mcontext: CIContext!
    var mfilter: CIFilter!
    var beginImg: CIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "image")!
        guard let cImage = CIImage(image: image) else {return}
        guard let cFilter = CIFilter(name: "CISepiaTone")  else {return}
        cFilter.setValue(cImage, forKey: kCIInputImageKey)
        cFilter.setValue(0.5, forKey: kCIInputIntensityKey)
        guard let outputImage = cFilter.outputImage else { return  }
        
        
        //        let newImage = UIImage(ciImage: outputImage)
        //        self.imageView.image = newImage
        
        let context = CIContext(options: nil)
        guard let cgImg = context.createCGImage(outputImage, from: outputImage.extent) else {return}
        imageView.image = UIImage(cgImage: cgImg)
        mcontext = context
        
        mfilter = cFilter
        beginImg = cImage
        
//        logAllFilterInfo()
//        generateImgForFilterChain()
        
        /** 运动模糊 */
//        montinBlurDemo()
        
        /** 文字转图片 */
        let text = "abc"
        textLabel.text = text
        showTextImg()
        
    }
     /** 文字->图片 */
    func showTextImg() {
        
//        guard let textData = textLabel.text?.data(using: .utf8) else {
//            print("text -> data error")
//            return
//        }

        
        /** Png 固定8个头字节*/
//        var textByteBuffer: [UInt8] = [137,80, 78, 71, 13, 10, 26, 10]
//
//        textData.withUnsafeBytes {
//            textByteBuffer.append(contentsOf: $0)
//        }
//
//        textByteBuffer.append(contentsOf: [0x00,0x00,0x00,0x00,0x49, 0x45, 0x4e, 0x44, 0xae, 0x42,0x60 ,0x82])
//
//
//        textByteBuffer.forEach {
//            print($0)
//        }
//        print(textData.count)
//        print("========")
        
//        let formatData = Data(bytes: textByteBuffer, count: textByteBuffer.count)
        
//        var byteBuffer: [UInt8] = []
//        textData.withUnsafeBytes {
//            byteBuffer.append(contentsOf: $0)
//        }
//        print(byteBuffer)
     
//        guard let img = UIImage(named: "pc_avatar") else {return}
        
        guard  let imgPath = Bundle.main.path(forResource: "pc_avatar.jpg", ofType: nil) else {
            print("img path error")
            return
            
        }
        
        guard let imgData = try? Data(contentsOf: URL(fileURLWithPath: imgPath)) else {
            print("img data error")
            return
            
        }
        
//        guard let imgData = img.pngData() else { return  }

        var imgByteBuffer: [UInt8] = []
        imgData.withUnsafeBytes {
            imgByteBuffer.append(contentsOf: $0)
        }

//        var i = 0;
//        imgByteBuffer.forEach {
//            i += 1
//            print(String(format: "%02x ",$0 ), separator: " ", terminator: "")
//            if i % 16 == 0 {
//                print("\n")
//            }
//        }
//        print("\n")
        
         /** 手工造的图像数据: 去除了png的辅助数据信息 */
//        let imgByteBuffer : [UInt8] = [0x89,0x50,0x4e,0x47,0x0d,0x0a,0x1a,0x0a,0x00,0x00,0x00,0x0d,0x49,0x48,0x44,0x52,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x08,0x08,0x06,0x00,0x00,0x00,0xc4,0x0f,0xbe,0x8b,0x00,0x00,0x00,0x3c,0x49,0x44,0x41,0x54,0x28,0x15,0x62,0x60,0x00,0x02,0xe9,0x6d,0x0e,0x32,0xe2,0x9b,0xac,0x96,0x89,0x6d,0xb4,0x7e,0x06,0xc2,0x20,0x36,0x48,0x0c,0x24,0x07,0x93,0x7c,0x2b,0xb6,0xd1,0xea,0x3f,0x32,0x06,0x2a,0x7a,0x0b,0x56,0x04,0xd1,0x89,0x2a,0x09,0x53,0x08,0x92,0x63,0x80,0x18,0x8b,0x5d,0x01,0x48,0x0e,0x00,0x00,0x00,0xff,0xff,0xd4,0xa5,0xce,0x85,0x00,0x00,0x00,0x3b,0x49,0x44,0x41,0x54,0x63,0x10,0xdb,0x68,0xfd,0x4c,0x6c,0xa3,0xd5,0x7f,0xec,0xd8,0xfa,0x19,0x83,0xf8,0x26,0xab,0x65,0xd8,0x25,0xad,0xfe,0x83,0xe4,0x18,0xa4,0xb7,0x39,0xc8,0x00,0x19,0x6f,0xd1,0x15,0x81,0xc4,0x40,0x72,0x0c,0x20,0x00,0x55,0x04,0x34,0x09,0x64,0x9d,0xf5,0x33,0x90,0x4e,0x98,0x24,0x00,0x5f,0xcc,0x6d,0xb1,0xb7,0x49,0xec,0x5a,0x00,0x00,0x00,0x00,0x49,0x45,0x4e,0x44,0xae,0x42,0x60,0x82]
//
        let formatData = Data(bytes: imgByteBuffer, count: imgByteBuffer.count)

        guard let img1 = UIImage(data: formatData) else {

            print("data -> img error")
            return
        }
        randomImgView.image = img1
    }
    func montinBlurDemo()  {
        // CIMotionBlur      运动模糊
        // CIGaussianBlur    高斯模糊
        guard let mbFilter = CIFilter(name: "CIGaussianBlur", parameters: [kCIInputImageKey:beginImg!]) else { return  }
        mbFilter.setValue(5, forKey: "inputRadius")
        
        guard let outputCImage = mbFilter.outputImage else { return }
        guard let cgImg = mcontext.createCGImage(outputCImage, from: outputCImage.extent) else {return}
        
        randomImgView.image = UIImage(cgImage: cgImg)
    }
    
    func logAllFilterInfo() {
        let properties = CIFilter.filterNames(inCategory: kCICategoryBuiltIn)
        properties.forEach{
            print($0)
        }
    }
    /** 滤镜链条 */
    func generateImgForFilterChain()  {
        
        let randomFilter = CIFilter(name: "CIRandomGenerator")
        
        
        guard let lightenFilter = CIFilter(name: "CIColorControls") else { return }
        lightenFilter.setValue(randomFilter?.outputImage, forKey: kCIInputImageKey)
        lightenFilter.setValue(0.2, forKey: "inputBrightness")
        lightenFilter.setValue(0.8, forKey: "inputSaturation")
    
        let cropImg = lightenFilter.outputImage!.cropped(to: beginImg.extent)
        
        
        guard let compsite = CIFilter(name: "CIHardLightBlendMode") else { return  }
        compsite.setValue(beginImg, forKey: kCIInputImageKey)
        compsite.setValue(cropImg, forKey: kCIInputBackgroundImageKey)

        guard let compImg = compsite.outputImage/*.cropped(to: beginImg.extent)*/ else { return  }

        randomImgView.image = UIImage(ciImage: compImg);
        
        
    }
    
    
    @IBAction func changeSlider(_ sender: UISlider) {
        let sliderValue = sender.value;
        mfilter.setValue(sliderValue, forKey: kCIInputIntensityKey)
        guard let outputImg = mfilter.outputImage else {return}
        guard let cgImg = mcontext.createCGImage(outputImg, from: outputImg.extent) else {return}
        let img = UIImage(cgImage: cgImg)
        imageView.image = img
    
    }
    
    @IBAction func clickedOpenAlbum(_ sender: UIButton) {
        let pickVC = UIImagePickerController()
        pickVC.delegate = self
        present(pickVC, animated: true, completion: nil)
    }
    
    
    @IBAction func clickedSaveToAblumBtn(_ sender: UIButton) {
        guard let ciImage = mfilter.outputImage else { return  }
        let ciContext = CIContext(options: [CIContextOption.useSoftwareRenderer : true])
        guard let cgImage = ciContext.createCGImage(ciImage, from: ciImage.extent) else { return  }
        let library = ALAssetsLibrary()
        library.writeImage(toSavedPhotosAlbum: cgImage, metadata: ciImage.properties, completionBlock: nil)
    }
    
    
}


/** UIImagePickerControllerDelegate 协议方法*/
extension ViewController: UINavigationControllerDelegate,UIImagePickerControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        let selectedImg = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        print(selectedImg.imageOrientation.rawValue)
        beginImg = CIImage(image: selectedImg)
        mfilter.setValue(beginImg, forKey: kCIInputImageKey)
        changeSlider(imgSlider)
        
    }
}
