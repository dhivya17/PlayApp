//
//  ViewController.swift
//  iPlay
//
//  Created by mac_admin on 27/10/17.
//  Copyright © 2017 mac_admin. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {
   var users: [NSManagedObject] = []
 
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var email: UITextField!
    @IBAction func loginAction(_ sender: Any) {
        activityIndicator.startAnimating()
      
        self.view.isUserInteractionEnabled = false
        self.view.alpha = 0.5
        guard let email = email.text, email.count > 8 , let password = passwordField.text, password.count > 4 else{
            showAlert("Error","Please fill up the fields")
            return
        }
        for user in users {
           let name =   user.value(forKey: "email") as! String
            let password = user.value(forKey: "password") as! String
            if email.caseInsensitiveCompare(name) == ComparisonResult.orderedSame && password.caseInsensitiveCompare(password) == ComparisonResult.orderedSame {
                 activityIndicator.stopAnimating()
                 makeViewVisible()
                 let interest =   user.value(forKey: "interest") as! String
                 UserDefaults.standard.setValue(interest, forKey: "interest")
                 self.performSegue(withIdentifier: "main", sender: self)
            } else{
               showAlert("Error","Invalid username and password")
               makeViewVisible()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.hidesWhenStopped = true
        email.text = "dhivi1792@gmail.com"
        passwordField.text = "dhivi"
        guard let appDelegate =  UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Users")
        do {
            users = try managedContext.fetch(fetchRequest)
        }
        catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
            
        }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showAlert(_ title:String, _ message:String)
    {
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
    self.present(alert, animated: true, completion: nil)
    }
    func makeViewVisible()
    {
        self.view.isUserInteractionEnabled = true
        self.view.alpha = 1
        email.text = ""
        passwordField.text = ""
        
    }
}
extension LoginViewController : UITextFieldDelegate {
    //MARK:- TextField METHODS
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField .resignFirstResponder()
        return true
    }
}

