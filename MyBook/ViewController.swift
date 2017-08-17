//
//  ViewController.swift
//  MyBook
//
//  Created by ktds 19 on 2017. 8. 17..
//  Copyright © 2017년 cjon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LoginViewControllerProtocol {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var pwLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let idStr = UserDefaults.standard.string(forKey: "userId")
    
        let pwStr = UserDefaults.standard.string(forKey: "userPassword")
        
        if let id = idStr  {
            let welcomdAlert = UIAlertController(title: "My Book", message: "Welcome, \(id)", preferredStyle: .alert)
            
            welcomdAlert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
                
            self.present(welcomdAlert, animated: true, completion: nil)
        }
        else{
            self.performSegue(withIdentifier: "mainToLogin", sender: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? LoginViewController {
            vc.delegate = self
        }
     }
 
    func send(withId:String, password:String){
        
        idLabel.text = withId
        pwLabel.text = password
        
        
        UserDefaults.standard.set(withId, forKey: "userId")
        UserDefaults.standard.set(password, forKey: "userPassword")
    }
    

}

