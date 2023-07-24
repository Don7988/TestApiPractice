//
//  DataModel.swift
//  APIPractice
//
//  Created by Don Dominic on 24/07/23.
//

import UIKit

class DataModel {
    var id: String?
    var author: String?
    var width: Int?
    var height: Int?
    var url: String?
    var download_url: String?
    
    init(_ dict:[String:Any]) {
        if let id = dict ["id"] as? String{
            self.id = id
        }
        if let author = dict ["author"] as? String{
            self.author = author
        }
        if let width = dict ["width"] as? Int{
            self.width = width
        }
        if let height = dict ["height"] as? Int{
            self.height = height
        }
        if let url = dict ["url"] as? String{
            self.url = url
        }
        if let download_url = dict ["download_url"] as? String{
            self.download_url = download_url
        }
    }
}
