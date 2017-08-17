//
//  Book.swift
//  MyBook
//
//  Created by ktds 19 on 2017. 8. 17..
//  Copyright © 2017년 cjon. All rights reserved.
//

import Foundation
import UIKit

class Book {
    
    var title : String
    var writer : String
    var publisher : String
    var coverImage : UIImage
    var descripter : String
    var price : Int
    var url:String
    
    init(title:String, writer:String, publisher:String, coverImage:UIImage,
         descripter:String, price:Int, url:String) {
        self.title = title
        self.writer = writer
        self.publisher = publisher
        self.coverImage = coverImage
        self.descripter = descripter
        self.price = price
        self.url = url
    }
    
    
    
}
