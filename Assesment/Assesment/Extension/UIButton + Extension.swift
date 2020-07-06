//
//  UIImageView + Extension.swift
//  Assesment
//
//  Created by Jayaprada on 06/07/20.
//  Copyright © 2020  . All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    
    
    func setCornerRadiusAndShadow() {
        self.layer.cornerRadius = self.bounds.height / 2
        self.layer.masksToBounds = true
             self.backgroundColor = UIColor.white
             self.clipsToBounds = true

            self.layer.shadowPath =
                  UIBezierPath(roundedRect: self.bounds,
                  cornerRadius: self.layer.cornerRadius).cgPath
            self.layer.shadowColor = UIColor.lightGray.cgColor
            self.layer.shadowOpacity = 0.2
            self.layer.shadowOffset = CGSize(width: 2, height: 2)
            self.layer.shadowRadius = 1
            self.layer.masksToBounds = false

            
     }
    
}
