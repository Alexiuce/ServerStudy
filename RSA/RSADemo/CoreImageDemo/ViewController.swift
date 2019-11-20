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
        textLabel.text = "Hello World"
        showTextImg()
        
    }
     /** 文字->图片 */
    func showTextImg() {
        
        guard let textData = textLabel.text?.data(using: .utf8) else {
            print("text -> data error")
            return
        }
       
        var byteBuffer: [UInt8] = []
        textData.withUnsafeBytes {
            byteBuffer.append(contentsOf: $0)
        }
        print(byteBuffer)
     

        guard let img = UIImage(data: textData) else {

           
            print("data -> img error")
            return
        }
        randomImgView.image = img
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
