//
//  Book.swift
//  MyBook
//
//  Created by ktds 19 on 2017. 8. 17..
//  Copyright © 2017년 cjon. All rights reserved.
//

import Foundation
import UIKit

class Book : NSObject, NSCoding{
    
    var title : String
    var writer : String?
    var publisher : String?
    var coverImage : UIImage?
    var descripter : String?
    var price : Int?
    var url:String?
    
    
    convenience init(title:String, coverImage:UIImage? ) {
        
        self.init(title: title, writer: nil, publisher: nil, coverImage: coverImage, descripter: nil, price: nil, url: nil)
//        self.title = title
//        self.coverImage = coverImage
    }
    
    init(title:String, writer:String?, publisher:String?, coverImage:UIImage?,
         descripter:String?, price:Int?, url:String?) {
        self.title = title
        self.writer = writer
        self.publisher = publisher
        self.coverImage = coverImage
        self.descripter = descripter
        self.price = price
        self.url = url
    }
    
    // File > Instance
    required init?(coder aDecoder: NSCoder) {
        self.title = aDecoder.decodeObject(forKey: "title") as! String
        self.writer = aDecoder.decodeObject(forKey: "writer") as? String
        self.publisher = aDecoder.decodeObject(forKey: "publisher") as? String
        self.coverImage = aDecoder.decodeObject(forKey: "coverImage") as? UIImage
        self.price = aDecoder.decodeObject(forKey: "price") as? Int
        self.descripter = aDecoder.decodeObject(forKey: "descripter") as? String
        self.url = aDecoder.decodeObject(forKey: "url") as? String
        
    }
    
    // Instance > File
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.title, forKey:"title")
        aCoder.encode(self.writer, forKey:"writer")
        aCoder.encode(self.publisher, forKey:"publisher")
        aCoder.encode(self.coverImage, forKey:"coverImage")
        aCoder.encode(self.price, forKey:"price")
        aCoder.encode(self.descripter, forKey:"descripter")
        aCoder.encode(self.url, forKey:"url")
        
    }
    
}
