//
//  VideoColViewCell.swift
//  Assesment
//
//  Created by Jayaprada on 06/07/20.
//  Copyright © 2020  . All rights reserved.
//

import UIKit

class VideoColViewCell: UICollectionViewCell {
    @IBOutlet weak var videoThumbnailImgView: UIImageView!
    
    @IBOutlet weak var lblVideoSize: UILabel!
    @IBOutlet weak var imgStatus: UIImageView!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
