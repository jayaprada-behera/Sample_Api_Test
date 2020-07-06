//
//  UIImageView + Extension.swift
//  Assesment
//
//  Created by Jayaprada on 06/07/20.
//  Copyright © 2020  . All rights reserved.
//

import Foundation
import UIKit
import Nuke

extension UIImageView {

    private var activityIndicator: UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = UIColor.black
        self.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        let centerX = NSLayoutConstraint(item: self,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: activityIndicator,
                                         attribute: .centerX,
                                         multiplier: 1,
                                         constant: 0)
        let centerY = NSLayoutConstraint(item: self,
                                         attribute: .centerY,
                                         relatedBy: .equal,
                                         toItem: activityIndicator,
                                         attribute: .centerY,
                                         multiplier: 1,
                                         constant: 0)
        self.addConstraints([centerX, centerY])
        return activityIndicator
    }
    
    
    private func transition(toImage image: UIImage?) {
        UIView.transition(with: self, duration: 0.3,
                          options: [.transitionCrossDissolve],
                          animations: {
                            self.image = image
        },
                          completion: nil)
    }
    
    func setCornerRadious() {
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
    
    func loadImage(with urlString: String?, placeholder: UIImage? = nil) {
        let urlValue = urlString?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        guard let urlString = urlValue, let url = URL(string: urlString) else { return }
        var options = ImageLoadingOptions(placeholder: placeholder, failureImage: placeholder)
        options.transition = .fadeIn(duration: 0.5)
        Nuke.loadImage(with: url, options: options, into: self)
    }
    
}
