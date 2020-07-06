//
//  VideoCellDataSource.swift
//  Assesment
//
//  Created by Jayaprada on 06/07/20.
//  Copyright © 2020  . All rights reserved.
//

import UIKit

 

class VideoCellDataSource: NSObject,UICollectionViewDataSource {
    
    var videoModels : [VideoModel] = []
let cellIdentifier = "cellIdentifier"
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videoModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? VideoColViewCell
            else {
                return UICollectionViewCell()
        }
        
        let videoFileObj = videoModels[indexPath.item]
        cell.lblDate.text =
            videoFileObj.dateTime?.getDateStringFormattedDate()
        cell.lblTime.text = "@"  + (videoFileObj.dateTime?.getTimeFormattedDate())! 
        cell.lblVideoSize.text = videoFileObj.fileSize
       cell.videoThumbnailImgView.loadImage(with: videoFileObj.thumbnail,placeholder: UIImage())
        cell.imgStatus.image = UIImage(named: videoFileObj.status! + ".png" )
         return cell
        
    }
    
    
    
    

}
