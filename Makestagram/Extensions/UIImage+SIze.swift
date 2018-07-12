//
//  UIImage+SIze.swift
//  Makestagram
//
//  Created by Cindy Wang on 7/12/18.
//  Copyright © 2018 cxw. All rights reserved.
//

import UIKit

extension UIImage {
    var aspectHeight: CGFloat {
        let heightRatio = size.height / 736
        let widthRatio = size.width / 414
        let aspectRatio = fmax(heightRatio, widthRatio)
        
        return size.height / aspectRatio
    }
}
