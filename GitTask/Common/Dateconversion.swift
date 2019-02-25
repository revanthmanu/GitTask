//
//  Dateconversion.swift
//  GitTask
//
//  Created by Zenwise Technologies Private Limited on 25/02/19.
//  Copyright © 2019 Zenwise Technologies Private Limited. All rights reserved.
//

import Foundation

class Dateconversion: NSObject {
    
    
    
    class func dateconversion(date: String) -> String {
        
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        
        // convert your string to date
        let yourDate = formatter.date(from: date)
        //then again set the date format whhich type of output you need
        formatter.dateFormat = "dd-MMM-yyyy"
        // again convert your date to string
        let dateString = formatter.string(from: yourDate!)
        
        return dateString
       
    }
    
   

}
