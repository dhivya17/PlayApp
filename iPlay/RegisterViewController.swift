//
//  RegisterViewController.swift
//  iPlay
//
//  Created by mac_admin on 27/10/17.
//  Copyright © 2017 mac_admin. All rights reserved.
//

import UIKit
import CoreData
class RegisterViewController: UIViewController {

    @IBOutlet var fnameField: UITextField!
    @IBOutlet var interestsView: UIPickerView!
    @IBOutlet var bday: UIDatePicker!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
   
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBAction func registerAction(_ sender: Any) {
          activityIndicator.isHidden = false
          activityIndicator.startAnimating()
        guard let fname = fnameField.text, let email = emailField.text, let password = passwordField.text else{
            showAlert("Error","Please fill up the fields")
            activityIndicator.stopAnimating()
            return
        }
        if(fname.count != 0 && email.count != 0 && password.count != 0){
            if(isValidEmail(email) && isValidName(fname) && isValidName(password)){
                print("\(email)-->\(fname)--->\(password)")
                self.view.isUserInteractionEnabled = false
                self.view.alpha = 0.5
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)!
                let registeredUser = NSManagedObject(entity: entity,insertInto: context) as! RegisteredUser
                registeredUser.setValue(fname, forKey: "fname")
                registeredUser.setValue(password, forKey: "password")
                registeredUser.setValue(interestSelected, forKey: "interest")
                registeredUser.setValue(strDate, forKey: "bday")
                registeredUser.setValue(email, forKey: "email")             
                
                do {
                    try context.save()
                    makeViewVisible()
                    showAlert("Success","Registered Successfully!!! Please Login")
                  
                } catch let error as NSError {
                    makeViewVisible()
                   // showAlert("Success","Registered Successfully!!! Please Login")
                    if error.code == CocoaError.managedObjectConstraintMerge.rawValue {
                         showAlert("Oops!!", "Your email is already registered. Please Login")
                    }                  
                    print("Could not save. \(error), \(error.userInfo)")
                }
            }
            else
            {
               showAlert("Error", "Please enter valid texts")
            }
        }
        else{
           showAlert("Error", "Please fill up the fields")
          
        }
         activityIndicator.stopAnimating()
    }
    var interestsArr : [String]?
    var interestSelected : String?
    var strDate : String?
    
    //MARK:- View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
        activityIndicator.hidesWhenStopped = true
        //default values
        interestSelected = "Photos"
        strDate = "17/12/2000"
        
        var plistData : [String : Any]?
        if let path = Bundle.main.path(forResource: "data", ofType: "plist") {
            plistData = NSDictionary(contentsOfFile: path) as? [String: Any]
        }
        if let arr = plistData!["interest"] {
            interestsArr = arr as? [String]
        }
        bday.addTarget(self, action: #selector(dateChanged(datePicker:)), for: UIControlEvents.valueChanged)
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
    // MARK: - HELPERS
    @objc func dateChanged(datePicker:UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        strDate = dateFormatter.string(from: datePicker.date)
       
    }
    func showAlert(_ title:String, _ message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    func isValidEmail(_ testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    func isValidName(_ testStr:String) -> Bool {
        let nameRegEx = "[A-Z0-9a-z. ]{4,10}"
        let nameTest = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
        return nameTest.evaluate(with: testStr)
    }
    func makeViewVisible()
    {
        self.view.isUserInteractionEnabled = true
        self.view.alpha = 1
        emailField.text = ""
        fnameField.text = ""
        passwordField.text = ""
        
    }

}

extension RegisterViewController: UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate{
    //MARK:- PickerView METHODS
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (interestsArr?.count)!
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return interestsArr![row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        interestSelected = interestsArr![row]
    }
     //MARK:- TextField METHODS
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField .resignFirstResponder()
        return true
    }
    
    
}
