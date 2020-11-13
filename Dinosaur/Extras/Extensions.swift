//
//  File.swift
//  Dinosaur
//
//  Created by Claudio Portuesi on 13/11/2020.
//

import Foundation
import UIKit

extension UIView {
    func addBackground(image: UIImageView) {
        self.addSubview(image)
        self.sendSubviewToBack(image)
    }
    
    func createFullscreenView(image: UIImage) -> UIImageView {
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageViewBackground.image = image

        imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill
        return imageViewBackground
    }
}

extension UIImageView {
    func resize(targetSize: CGSize) {
        let size = self.image!.size

        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height

        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }

        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        self.image!.draw(in: rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        //UIGraphicsEndImageContext()
        
        self.image = image
    }
}
