//
//  Helper.swift
//  Messanger
//
//  Created by Feihong Zhao on 2017-03-03.
//  Copyright © 2017 Feihong Zhao. All rights reserved.
//

import UIKit

extension UIView {
    func addCustomView(_ view: UIView){
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
    }
}


class BaseCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        
    }
    
}

extension UIImage {
    func resizeToWidth(_ newWidth: CGFloat) -> UIImage {
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
