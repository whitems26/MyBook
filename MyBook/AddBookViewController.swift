//
//  AddBookViewController.swift
//  MyBook
//
//  Created by ktds 19 on 2017. 8. 18..
//  Copyright © 2017년 cjon. All rights reserved.
//

import UIKit

protocol AddBookDelegate {
    func sendNewBook(book:Book)
}

class AddBookViewController: UIViewController {

    var delegate : AddBookDelegate?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var writerTextField: UITextField!
    @IBOutlet weak var publisherTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var descTextView: UITextView!
    
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBAction func onSave(_ sender: Any) {
        
        guard let title = titleTextField.text else {
            return
        }
        
        if title == "" {
            let alert = UIAlertController(title: "Error", message: "Please put the title", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return

        }
        else{
            let optPrice:Int?
            
            if let price = priceTextField.text {
                optPrice = Int(price)
            }
            else{
                optPrice = nil
            }
            
            let book = Book(title: title, writer: writerTextField.text, publisher: publisherTextField.text, coverImage: coverImageView.image, descripter: descTextView.text, price: optPrice, url: urlTextField.text)
            
            if let prevVC = delegate {
                prevVC.sendNewBook(book: book)
            }
            
            self.dismiss(animated: true, completion: nil)

        }
        
        
    }
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
   
}

extension AddBookViewController : UIGestureRecognizerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool{
        
        let imagePicketController = UIImagePickerController()
        imagePicketController.sourceType = .photoLibrary
        imagePicketController.allowsEditing = true
        imagePicketController.delegate = self
        
        self.present(imagePicketController, animated: true, completion: nil)
    
        return true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
        
            self.coverImageView.image = editedImage
            picker.dismiss(animated: true, completion: nil)
        }
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}

