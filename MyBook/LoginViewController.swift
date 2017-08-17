//
//  LoginViewController.swift
//  MyBook
//
//  Created by ktds 19 on 2017. 8. 17..
//  Copyright © 2017년 cjon. All rights reserved.
//

import UIKit

protocol LoginViewControllerProtocol {
    func send(withId:String, password:String)
}


class LoginViewController: UIViewController {

    var delegate:LoginViewControllerProtocol?
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    

    @IBAction func onLogin(_ sender: Any) {
        
        
        let idStr = idTextField.text
        let pwStr = pwTextField.text
        
        
        if let preVC = self.delegate {
            
            if let id = idStr, let pw = pwStr {
                preVC.send(withId: id, password: pw)
            }
            
        }
        
        self.navigationController?.popViewController(animated: true)
        
    
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
