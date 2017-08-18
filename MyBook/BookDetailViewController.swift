//
//  BookDetailViewController.swift
//  MyBook
//
//  Created by ktds 19 on 2017. 8. 17..
//  Copyright © 2017년 cjon. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {

    var book:Book?
    
    
    @IBOutlet weak var bookCoverImageView: UIImageView!
    @IBOutlet weak var bookWriterLabel: UILabel!
    @IBOutlet weak var bookPublishLabel: UILabel!
    @IBOutlet weak var bookPriceLabel: UILabel!

    @IBOutlet weak var bookDescriptionTextview: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        guard let newBook = book else {
            return
        }
        
        
        bookCoverImageView.image = newBook.coverImage
        bookWriterLabel.text = newBook.writer
        bookPublishLabel.text = newBook.publisher
        
        if let bookPrice = newBook.price {
             bookPriceLabel.text = String(bookPrice)
        }
       
        bookDescriptionTextview.text = newBook.descripter
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
  
        if let webVC = segue.destination as? WebViewController {
            webVC.url = self.book?.url
        }
        
    }
 

}
