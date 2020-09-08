//
//  ViewController.swift
//  Core Graphics
//
//  Created by Melike Büşra Ayhan on 8.09.2020.
//  Copyright © 2020 com.lyrebird. All rights reserved.
//

import UIKit
//  Bitmap structure

public struct PixelData {
    var a, r, g, b: UInt8

    init(r: UInt8 = 0, g: UInt8 = 0, b: UInt8 = 0) {
        self.a = 255
        self.r = r
        self.g = g
        self.b = b
    }
    
    init(_ white: UInt8) {
        self.init(r: white, g: white, b: white)
    }
    
    init(_ v: IntData, div: Int) {
        self.a = 255
        self.r = UInt8(v.r * 255 / div)
        self.g = UInt8(v.g * 255 / div)
        self.b = UInt8(v.b * 255 / div)
    }
}
//  Histogram structure

public struct IntData {
    var r, g, b: Int
    
    init() {
        self.r = 0
        self.g = 0
        self.b = 0
    }
    
    var maxRGB : Int {
        return max( max(r, g), b)
    }
}
class ViewController: UIViewController {
 
    @IBOutlet weak var histogramView: HistogramView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var outImage: UIImageView!
    lazy var inImage : UIImageView = {
       let iv  = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .lightGray
        iv.image = UIImage.init(named: "kapadokya")
        iv.frame = CGRect.init(x: 0, y: 0, width: 100, height: 100)
        return iv
    }()
     
    let context = CIContext()
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.backgroundColor = .lightGray
        imageView.image = UIImage.init(named: "kapadokya")
         
     imageView.addSubview(inImage)
    inImage.anchor(top: nil, left: imageView.leftAnchor, bottom:nil, right: imageView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        
               imageView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
               imageView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
               
         
        // Do any additional setup after loading the view.
    }
    @IBAction func saveDraw(_ sender: UIButton) {
          
        let image = imageView.asImage()
        outImage.image = image
        convertHistogram()
    }
    @IBAction func saveLocals(_ sender: UIButton) {
        saveLocal()
        
    }
    @objc func convertHistogram(){
           
        let sourceCGImage = imageView.image?.cgImage
        let histData = calculateHistogram(fromImage: sourceCGImage!)  
        let imageHist = CIImage(cgImage: imageFromARGB32Bitmap(pixels: histData, width: 256, height: 1)!)
        
        let histImage = histogramDisplayFilter(imageHist, height: 200, highLimit: 1.0, lowLimit: 0.0)
        let cgImage = context.createCGImage(histImage!, from: histImage!.extent)
        let uiImage = UIImage(cgImage: cgImage!)
        
        outImage.image = uiImage
        

    }
    func histogramDisplayFilter(_ input: CIImage, height: Float = 100, highLimit: Float = 1.0, lowLimit: Float = 0.0) -> CIImage?
    {
        let filter = CIFilter(name:"CIHistogramDisplayFilter")
        filter?.setValue(input,     forKey: kCIInputImageKey)
        filter?.setValue(height,    forKey: "inputHeight")
        filter?.setValue(highLimit, forKey: "inputHighLimit")
        filter?.setValue(lowLimit,  forKey: "inputLowLimit")
        return filter?.outputImage
    }
    
    func calculateHistogram(fromImage image: CGImage) -> [PixelData] {
    
        var hist : [IntData] = Array(repeating: IntData(), count: 256)
        
        let pixelData = image.dataProvider!.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        for i in 0..<Int(image.width * image.width) {
            hist[ Int(data[i*4+0]) ].r += 1
            hist[ Int(data[i*4+1]) ].g += 1
            hist[ Int(data[i*4+2]) ].b += 1
        }
        // max. value of all histogram entries and normalize output to 0...255
        let maxValue : Int = hist.reduce(0) { max($0, $1.maxRGB) }
        return hist.map { PixelData($0, div: maxValue) }
    }
    func imageFromARGB32Bitmap(pixels: [PixelData], width: Int, height: Int) -> CGImage? {
        
        guard width > 0 && height > 0 else             { return nil }
        guard pixels.count == width * height else     { return nil }
        
        let size = MemoryLayout<PixelData>.size
        
        var data = pixels                             // Copy to mutable []
        guard let provider = CGDataProvider(data: NSData(bytes: &data, length: data.count * size) )
            else { return nil }
        
        guard let cgImage = CGImage(
            width:                 width,
            height:             height,
            bitsPerComponent:     8 * size / 4,
            bitsPerPixel:         8 * size,
            bytesPerRow:         width * size,
            space:                 CGColorSpaceCreateDeviceRGB(),
            bitmapInfo:         CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedFirst.rawValue),
            provider:             provider,
            decode:             nil,
            shouldInterpolate:     true,
            intent:             .defaultIntent
            )
            else { return nil }
        
        return cgImage
    }
    func saveLocal(){
        
        
        guard let selectedImage = outImage.image else {
                print("Image not found!")
                return
            }
            UIImageWriteToSavedPhotosAlbum(selectedImage, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
           if let error = error {
               // we got back an error!
               showAlertWith(title: "Save error", message: error.localizedDescription)
           } else {
               showAlertWith(title: "Saved!", message: "Your image has been saved to your photos.")
           }
       }

       func showAlertWith(title: String, message: String){
           let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
           ac.addAction(UIAlertAction(title: "OK", style: .default))
           present(ac, animated: true)
       }

}
extension UIView{
    func asImage() -> UIImage?{
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { (ctx) in
            layer.render(in: ctx.cgContext)
        }
    }
 
        func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
            
            translatesAutoresizingMaskIntoConstraints = false
            
            if let top = top {
                self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
            }
            
            if let left = left {
                self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
            }
            
            if let bottom = bottom {
                self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
            }
            
            if let right = right {
                self.rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
            }
            
            if width != 0 {
                widthAnchor.constraint(equalToConstant: width).isActive = true
            }
            
            if height != 0 {
                heightAnchor.constraint(equalToConstant: height).isActive = true
            }
        }
         

}

