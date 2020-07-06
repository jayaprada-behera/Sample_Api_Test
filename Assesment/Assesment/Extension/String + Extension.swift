//
//  UIImageView + Extension.swift
//  Assesment
//
//  Created by Jayaprada on 06/07/20.
//  Copyright © 2020  . All rights reserved.
//



import Foundation

extension String {
     func getDateStringFormattedDate(inputFormat: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ", outputFormat: String = "yyyy-MM-dd") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = inputFormat
        guard let date = formatter.date(from: self) else {return ""}
        formatter.dateFormat = outputFormat
        let string = formatter.string(from: date)
        return string
    }
    
    func getTimeFormattedDate(inputFormat: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ", outputFormat: String = "HH:mm:ss") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = inputFormat
        guard let date = formatter.date(from: self) else {return ""}
        formatter.dateFormat = outputFormat
        let string = formatter.string(from: date)
        return string
    }
    
   

}
 
